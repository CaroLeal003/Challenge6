//
//  RythmGameBars.swift
//  Challenge6_Dhakium
//
//  Created by Carolina Nicole Gonzalez Leal on 20/05/25.
//

import SwiftUI

struct RythmGameBars<Content: View>: UIViewRepresentable {
    @Binding var scrollOffset: CGFloat
    let content: () -> Content

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollOffset: $scrollOffset)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = false
        scrollView.delegate = context.coordinator

        let hostingController = UIHostingController(rootView: AnyView(content()))
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear

        context.coordinator.hostingController = hostingController

        scrollView.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostingController.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {
        context.coordinator.hostingController?.rootView = AnyView(content())
        let offset = CGPoint(x: scrollOffset, y: 0)
        uiView.setContentOffset(offset, animated: false)
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        @Binding var scrollOffset: CGFloat
        var hostingController: UIHostingController<AnyView>? = nil

        init(scrollOffset: Binding<CGFloat>) {
            self._scrollOffset = scrollOffset
        }
    }
}


