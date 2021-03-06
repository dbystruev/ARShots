//
//  ViewController.swift
//  ARShots
//
//  Created by Denis Bystruev on 26/05/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func createHoop() -> SCNNode {
        let node = SCNNode()
        
        node.addChildNode(createBackBoard())
        node.addChildNode(createRim())
        
        return node
    }
    
    func createBackBoard() -> SCNNode {
        let geometry = SCNBox(width: 1.8, height: 1.1, length: 0.1, chamferRadius: 0)
        geometry.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/wood.jpg")
        
        let node = SCNNode()
        node.geometry = geometry
        
        return node
    }
    
    func createRim() -> SCNNode {
        let geometry = SCNTorus(ringRadius: 0.45, pipeRadius: 0.01)
        geometry.firstMaterial?.diffuse.contents = UIColor.orange
        
        let node = SCNNode()
        node.geometry = geometry
        
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
