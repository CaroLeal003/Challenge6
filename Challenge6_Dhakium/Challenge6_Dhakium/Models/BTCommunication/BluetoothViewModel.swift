import Foundation
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    private var centralManager: CBCentralManager!
    private var discoveredPeripheral: CBPeripheral?
    private var txCharacteristic: CBCharacteristic?

    private let targetServiceUUID = CBUUID(string: "FFE0") // Es: HM-10
    private let targetCharacteristicUUID = CBUUID(string: "FFE1") // Es: HM-10

    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    // MARK: - Public
    func send(command: String) {
        guard let peripheral = discoveredPeripheral,
              let characteristic = txCharacteristic,
              let data = command.data(using: .utf8)
        else {
            print("Error: Device or characteristic not available")
            return
        }

        peripheral.writeValue(data, for: characteristic, type: .withResponse)
        print("Sent: \(command)")
    }

    // MARK: - CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Bluetooth activated. Start scanning...")
            centralManager.scanForPeripherals(withServices: [targetServiceUUID], options: nil)
        } else {
            print("Bluetooth not activated.")
        }
    }

    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {

        print("Devidce found: \(peripheral.name ?? "unknown")")

        discoveredPeripheral = peripheral
        centralManager.stopScan()
        centralManager.connect(peripheral, options: nil)
        peripheral.delegate = self
    }

    func centralManager(_ central: CBCentralManager,
                        didConnect peripheral: CBPeripheral) {
        print("Connected to \(peripheral.name ?? "device")")
        peripheral.discoverServices([targetServiceUUID])
    }

    func centralManager(_ central: CBCentralManager,
                        didFailToConnect peripheral: CBPeripheral,
                        error: Error?) {
        print("Connection failed: \(error?.localizedDescription ?? "unknown error")")
    }

    // MARK: - CBPeripheralDelegate

    func peripheral(_ peripheral: CBPeripheral,
                    didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services where service.uuid == targetServiceUUID {
                print("Service found: \(service.uuid)")
                peripheral.discoverCharacteristics([targetCharacteristicUUID], for: service)
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral,
                    didDiscoverCharacteristicsFor service: CBService,
                    error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics where characteristic.uuid == targetCharacteristicUUID {
                print("characteristic TX found: \(characteristic.uuid)")
                txCharacteristic = characteristic
            }
        }
    }
}
