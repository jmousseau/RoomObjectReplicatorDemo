//
//  ViewController.swift
//  RoomObjectReplicatorDemo
//
//  Created by Jack Mousseau on 6/7/22.
//

import ARKit
import UIKit
import RealityKit
import RoomPlan
import RoomObjectReplicator

class ViewController: UIViewController {

    @IBOutlet var arView: ARView!

    var captureSession: RoomCaptureSession?
    var replicator = RoomObjectReplicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        captureSession = RoomCaptureSession()
        captureSession?.delegate = self
        captureSession?.run(configuration: .init())
    }

}

extension ViewController: RoomCaptureSessionDelegate {

    func captureSession(_ session: RoomCaptureSession, didAdd room: CapturedRoom) {
        replicator.anchor(objects: room.objects, in: session)
    }

    func captureSession(_ session: RoomCaptureSession, didChange room: CapturedRoom) {
        replicator.anchor(objects: room.objects, in: session)
    }

    func captureSession(_ session: RoomCaptureSession, didUpdate room: CapturedRoom) {
        replicator.anchor(objects: room.objects, in: session)
    }

    func captureSession(_ session: RoomCaptureSession, didRemove room: CapturedRoom) {
        replicator.anchor(objects: room.objects, in: session)
    }

    func captureSession(_ session: RoomCaptureSession, didStartWith configuration: RoomCaptureSession.Configuration) {
        arView.session.pause()
        arView.session = session.arSession
        arView.session.delegate = self
    }

}

extension ViewController: ARSessionDelegate {

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        arView.scene.addRoomObjectEntities(for: anchors)
    }

    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        arView.scene.updateRoomObjectEntities(for: anchors)
    }

}
