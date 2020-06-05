//
//  GameScene.swift
//  Colors
//
//  Created by Николай Владимирович Крайнюк on 7/23/19.
//  Copyright © 2019 Николай Владимирович Крайнюк. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
   
    var o4k1: SKLabelNode!
    var o4k2: SKLabelNode!
    var exitButton: SKSpriteNode!
    var menuButton: SKSpriteNode!
    var Polec: SKSpriteNode!
    var Yellow: SKSpriteNode!
    var p = Pole(width:18 , height:30);
    let mass:[String] = ["red", "yellow", "blue", "green", "orange"];
   // let thread = DispatchQueue.global(qos: .userInteractive)
   
    
     override func didMove(to view: SKView) {

       
        o4k1 = self.childNode(withName: "o4k1") as? SKLabelNode
        o4k2 = self.childNode(withName: "o4k2") as? SKLabelNode
        Polec = self.childNode(withName: "Pole") as? SKSpriteNode
        Yellow = self.childNode(withName: "Yellow") as? SKSpriteNode
        exitButton = self.childNode(withName: "exitButton") as? SKSpriteNode
        menuButton = self.childNode(withName: "menuButton") as? SKSpriteNode
        
      
        p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
        p.PrintPole(scene: self)
        
//        thread.async{
//
//            self.p.PlayerTimer(scene: self  , mass: self.mass , thread: self.thread)
//            self.thread.suspend()
//        }
        
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        if let location = touch?.location(in: self){
           
            let nodesArray = self.nodes(at: location)
            
            
//            thread.async{
//
//                self.p.PlayerTimer(scene: self  , mass: self.mass)
//                self.p.ClearMenu(scene: self)
//                self.p.showPlayerPanel(colors:   self.p.getColors(mass: self.mass) , scene: self)
//
//            }
            
            
        
           
            if nodesArray.first?.name == "red"{
                
               
               // self.p.label.removeFromParent()
                self.p.cube.removeFromParent()
               // self.p.label.text = "00:05"
               // self.thread.suspend()
                
              
                
                

                if p.whichStep == 1{
                    
                    p.timeO4ko = 0;
                    p.MeanColorFromFirst(cube:p.startFirst, newcolor: "red" );
                    p.VisitNull();
                    p.CalculateCountFirst(cube:p.startFirst, newcolor: "red");
                    p.VisitNull();
                    p.count = p.timeO4ko;
                    p.timeO4ko = 0;
                    p.whichStep = 2;
                    p.FirstOldColor = "red";
                    
                }
                else{
                    
                    p.timeO4ko2 = 0;
                    p.MeanColorFromSecond( cube:p.startSecond, newcolor:"red" );
                    p.VisitNull();
                    p.CalculateCountSecond(cube:p.startSecond, newcolor:"red");
                    p.VisitNull();
                    p.count2 = p.timeO4ko2;
                    p.timeO4ko2 = 0;
                    p.whichStep = 1;
                    p.SecondOldColor =  "red";
                    
                }
                
                
                p.ClearMenu(scene: self)
                p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
                p.Clear(scene:self)
                p.PrintPole(scene: self)
                o4k1.text = "\(p.count)"
                o4k2.text = "\(p.count2)"
            
                
                if (p.count > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    p.GetWinner( scene:self)
                }
                else if (p.count2 > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                
                
//                thread.async{
//
//                    self.p.PlayerTimer(scene: self  , mass: self.mass , thread: self.thread)
//                    self.thread.suspend()
//                }
                
                
            }
            else if nodesArray.first?.name == "green"{
            
                
                if p.whichStep == 1{
                    
                    p.timeO4ko = 0;
                    p.MeanColorFromFirst(cube:p.startFirst, newcolor: "green" );
                    p.VisitNull();
                    p.CalculateCountFirst(cube:p.startFirst, newcolor: "green");
                    p.VisitNull();
                    p.count = p.timeO4ko;
                    p.timeO4ko = 0;
                    p.whichStep = 2;
                    p.FirstOldColor = "green";
                    
                }
                else{
                    
                    p.timeO4ko2 = 0;
                    p.MeanColorFromSecond( cube:p.startSecond, newcolor:"green" );
                    p.VisitNull();
                    p.CalculateCountSecond(cube:p.startSecond, newcolor:"green");
                    p.VisitNull();
                    p.count2 = p.timeO4ko2;
                    p.timeO4ko2 = 0;
                    p.whichStep = 1;
                    p.SecondOldColor =  "green";
                    
                }
                p.ClearMenu(scene: self)
                p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
                p.Clear(scene:self)
                p.PrintPole(scene: self)
                o4k1.text = "\(p.count)"
                o4k2.text = "\(p.count2)"
                
                if (p.count > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    p.GetWinner( scene:self)
                }
                else if (p.count2 > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
              
                
            }
           
            else if nodesArray.first?.name == "orange"{
                
                if p.whichStep == 1{
                    
                    p.timeO4ko = 0;
                    p.MeanColorFromFirst(cube:p.startFirst, newcolor: "orange" );
                    p.VisitNull();
                    p.CalculateCountFirst(cube:p.startFirst, newcolor: "orange");
                    p.VisitNull();
                    p.count = p.timeO4ko;
                    p.timeO4ko = 0;
                    p.whichStep = 2;
                    p.FirstOldColor = "orange";
                    
                }
                else{
                    
                    p.timeO4ko2 = 0;
                    p.MeanColorFromSecond( cube:p.startSecond, newcolor:"orange" );
                    p.VisitNull();
                    p.CalculateCountSecond(cube:p.startSecond, newcolor:"orange");
                    p.VisitNull();
                    p.count2 = p.timeO4ko2;
                    p.timeO4ko2 = 0;
                    p.whichStep = 1;
                    p.SecondOldColor =  "orange";
                    
                }
                p.ClearMenu(scene: self)
                p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
                p.Clear(scene:self)
                p.PrintPole(scene: self)
                o4k1.text = "\(p.count)"
                o4k2.text = "\(p.count2)"
                
                if (p.count > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    p.GetWinner( scene:self)
                }
                else if (p.count2 > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
               
            }
            else if nodesArray.first?.name == "blue"{
                
                if p.whichStep == 1{
                    
                    p.timeO4ko = 0;
                    p.MeanColorFromFirst(cube:p.startFirst, newcolor: "blue" );
                    p.VisitNull();
                    p.CalculateCountFirst(cube:p.startFirst, newcolor: "blue");
                    p.VisitNull();
                    p.count = p.timeO4ko;
                    p.timeO4ko = 0;
                    p.whichStep = 2;
                    p.FirstOldColor = "blue";
                    
                }
                else{
                    
                    p.timeO4ko2 = 0;
                    p.MeanColorFromSecond( cube:p.startSecond, newcolor:"blue" );
                    p.VisitNull();
                    p.CalculateCountSecond(cube:p.startSecond, newcolor:"blue");
                    p.VisitNull();
                    p.count2 = p.timeO4ko2;
                    p.timeO4ko2 = 0;
                    p.whichStep = 1;
                    p.SecondOldColor =  "blue";
                    
                }
                p.ClearMenu(scene: self)
                p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
                p.Clear(scene:self)
                p.PrintPole(scene: self)
                o4k1.text = "\(p.count)"
                o4k2.text = "\(p.count2)"
                
                
                if (p.count > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    p.GetWinner( scene:self)
                }
                else if (p.count2 > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                
            }
            else if nodesArray.first?.name == "yellow"{
                
                if p.whichStep == 1{
                    
                    p.timeO4ko = 0;
                    p.MeanColorFromFirst(cube:p.startFirst, newcolor: "yellow" );
                    p.VisitNull();
                    p.CalculateCountFirst(cube:p.startFirst, newcolor: "yellow");
                    p.VisitNull();
                    p.count = p.timeO4ko;
                    p.timeO4ko = 0;
                    p.whichStep = 2;
                    p.FirstOldColor = "yellow";
                    
                }
                else{
                    
                    p.timeO4ko2 = 0;
                    p.MeanColorFromSecond( cube:p.startSecond, newcolor:"yellow" );
                    p.VisitNull();
                    p.CalculateCountSecond(cube:p.startSecond, newcolor:"yellow");
                    p.VisitNull();
                    p.count2 = p.timeO4ko2;
                    p.timeO4ko2 = 0;
                    p.whichStep = 1;
                    p.SecondOldColor =  "yellow";
                    
                }
                p.ClearMenu(scene: self)
                p.showPlayerPanel(colors:   p.getColors(mass: mass) , scene:self)
                p.Clear(scene:self)
                p.PrintPole(scene: self)
                o4k1.text = "\(p.count)"
                o4k2.text = "\(p.count2)"
                
                
                if (p.count > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    p.GetWinner( scene:self)
                }
                else if (p.count2 > (p.Width * p.Height) / 2)
                {
                    p.GetWinner( scene:self)
                }
                
            }
            else if nodesArray.first?.name == "exitButton"{
                
                 exit(0);
            }
            else if nodesArray.first?.name == "menuButton"{
                
                if let scene = SKScene(fileNamed: "MainMenu"){
                    
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene)
                    
                }
            }
        }
    }

}
















class Cube
{
    
    var N:Cube? ;
    var E:Cube? ;
    var S:Cube? ;
    var W:Cube? ;
    var Visited: Bool?;
    var Color: String?;
    
    
    init()
    {
        Color = nil;
        N = nil;
        W = nil;
        E = nil;
        S = nil;
        Visited = false;
    }
    
    
    init(color:String,  n:Cube?,  e:Cube? , s:Cube? ,  w:Cube?)
    {
        Color = color;
        N = n;
        W = w;
        E = e;
        S = s;
        Visited = false;
    }
}


class  Pole
{
    var Height:Int;
    var Width:Int;
    var startFirst:Cube;
    var startSecond:Cube;
    var count:Int;
    var count2:Int;
    var timeO4ko:Int;
    var timeO4ko2:Int;
    var FirstOldColor:String;
    var SecondOldColor:String;
    var status:Int;
    var timeNodes: [SKNode];
    var menuNodes: [SKNode];
    var whichStep: Int;
    var label = SKLabelNode(text: "00:05")
    var cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 360, height: 68))
    
    init(  width:Int , height:Int )
    {
        Width = width;
        Height = height;
        startFirst = Cube();
        var colors: [String] = ["red", "yellow", "blue", "green", "orange"]
        
        
        startFirst.Color = colors[Int(arc4random_uniform(UInt32(colors.count)))];
        
        
        var cubes = [Cube]();
        var cubes2 = [Cube]();
        
        var countW:Int = 1;
        var countH:Int  = 1;
        var cubeNow =  startFirst;
        
        while (countH < height)
        {
            if (countH > 1)
            {
                countW = 1;
                
                cubeNow.S = Cube( color: colors[Int(arc4random_uniform(UInt32(colors.count)))], n:cubeNow, e:nil ,  s:nil, w:nil);
                cubeNow = cubeNow.S!;
            }
            
            while (countW <= width)
            {
                cubes.append(cubeNow);
                if (countH > 1)
                {
                    cubeNow.N = cubes2[cubes2.count - 1];
                    cubeNow.N?.S = cubeNow;
                    cubes2.remove(at: cubes2.count - 1);
                }
                if (cubes.count < width)
                {
                    cubeNow.E = Cube(color:colors[Int(arc4random_uniform(UInt32(colors.count)))],  n:nil, e:nil, s:nil, w:nil);
                    cubeNow = cubeNow.E!;
                }
                countW += 1;
            }
            
            countW = 1;
            cubeNow.S = Cube(color:colors[Int(arc4random_uniform(UInt32(colors.count)))], n:cubeNow, e:nil, s:nil, w:nil);
            cubeNow = cubeNow.S!;
            countH += 1;
            
            
            while (countW <= width)
            {
                cubes2.append(cubeNow);
                cubeNow.N = cubes[cubes.count - 1];
                cubeNow.N?.S = cubeNow;
                cubes.remove(at:cubes.count - 1);
                
                if (countW < width)
                {
                    cubeNow.W = Cube(color:colors[Int(arc4random_uniform(UInt32(colors.count)))], n:nil, e:cubeNow, s:nil, w:nil);
                    cubeNow = cubeNow.W!;
                }
                countW += 1;
            }
            countH += 1;
        }
        
        startSecond = cubeNow;
        
        
        while startSecond.E != nil {
            
            startSecond = startSecond.E!
            
        }
        
        
        while(startSecond.Color == startFirst.Color)
        {
            startSecond.Color=colors[Int(arc4random_uniform(UInt32(colors.count)))];
        }
        
        FirstOldColor = startFirst.Color!;
        SecondOldColor = startSecond.Color!;
        count = 1;
        count2 = 1;
        status = 1;
        timeO4ko = 0;
        timeO4ko2 = 0;
        timeNodes = [];
        whichStep = 1;
        menuNodes = [];
    }
    
    
    
    func MeanColorFromFirst(cube:Cube, newcolor:String )
    {
        
        
        cube.Visited = true;
        cube.Color = newcolor;
        if (cube.N != nil && cube.N!.Color == FirstOldColor)
        {
            if (cube.N!.Visited != true)
            {
                MeanColorFromFirst(cube:cube.N!, newcolor:newcolor);
            }
        }
        if (cube.E !=  nil && cube.E!.Color == FirstOldColor)
        {
            if (cube.E!.Visited != true)
            {
                MeanColorFromFirst(cube:cube.E!, newcolor:newcolor);
            }
        }
        if (cube.S !=  nil && cube.S!.Color == FirstOldColor)
        {
            if (cube.S!.Visited != true)
            {
                MeanColorFromFirst(cube:cube.S!, newcolor:newcolor);
            }
        }
        if (cube.W !=  nil && cube.W!.Color == FirstOldColor)
        {
            if (cube.W!.Visited != true)
            {
                MeanColorFromFirst(cube:cube.W!, newcolor:newcolor);
            }
        }
        
    }
    
    
    
    
    func MeanColorFromSecond(cube:Cube, newcolor:String  )
    {
        
        cube.Visited = true;
        cube.Color = newcolor;
        
        if (cube.N !=  nil && cube.N!.Color == SecondOldColor )
        {
            if (cube.N!.Visited != true)
            {
                MeanColorFromSecond(cube:cube.N!, newcolor:newcolor);
            }
        }
        if (cube.E !=  nil && cube.E!.Color == SecondOldColor )
        {
            if (cube.E!.Visited != true)
            {
                MeanColorFromSecond(cube:cube.E!, newcolor:newcolor);
            }
        }
        if (cube.S !=  nil && cube.S!.Color == SecondOldColor)
        {
            if (cube.S!.Visited != true)
            {
                MeanColorFromSecond(cube:cube.S!, newcolor:newcolor);
            }
        }
        if (cube.W !=  nil && cube.W!.Color == SecondOldColor )
        {
            if (cube.W!.Visited != true)
            {
                MeanColorFromSecond(cube:cube.W!, newcolor:newcolor);
            }
        }
        
    }
    
    
    
    func CalculateCountFirst( cube:Cube ,  newcolor:String)
    {
        
        
        cube.Visited = true;
        timeO4ko += 1;
        
        if (cube.N != nil && cube.N!.Color == newcolor)
        {
            if (cube.N!.Visited != true)
            {
                CalculateCountFirst(cube:cube.N!, newcolor:newcolor);
            }
        }
        if (cube.E != nil && cube.E!.Color == newcolor )
        {
            if (cube.E!.Visited != true)
            {
                CalculateCountFirst(cube:cube.E!, newcolor:newcolor);
            }
        }
        if (cube.S != nil && cube.S!.Color == newcolor)
        {
            if (cube.S!.Visited != true)
            {
                CalculateCountFirst(cube:cube.S!, newcolor:newcolor);
            }
        }
        if(cube.W != nil && cube.W!.Color == newcolor)
        {
            if (cube.W!.Visited != true)
            {
                CalculateCountFirst(cube:cube.W!,newcolor: newcolor);
            }
        }
        
        
    }
    
    
    
    func CalculateCountSecond( cube:Cube,  newcolor:String)
    {
        
        
        cube.Visited = true;
        timeO4ko2 += 1;
        
        if (cube.N != nil && cube.N!.Color == newcolor)
        {
            if (cube.N!.Visited != true)
            {
                CalculateCountSecond(cube:cube.N!, newcolor:newcolor);
            }
        }
        if (cube.E != nil && cube.E!.Color == newcolor )
        {
            if (cube.E!.Visited != true)
            {
                CalculateCountSecond(cube:cube.E!, newcolor:newcolor);
            }
        }
        if (cube.S != nil && cube.S!.Color == newcolor)
        {
            if (cube.S!.Visited != true)
            {
                CalculateCountSecond(cube:cube.S!, newcolor:newcolor);
            }
        }
        if(cube.W != nil && cube.W!.Color == newcolor)
        {
            if (cube.W!.Visited != true)
            {
                CalculateCountSecond(cube:cube.W!, newcolor:newcolor);
            }
        }
    }
    
    
    
    
    func VisitNull()
    {
        
        var check:Cube? = startFirst;
        var check2:Cube? = startFirst;
        
        while (check2 != nil)
        {
            while (check != nil)
            {
                check?.Visited = false;
                check = check?.E;
            }
            
            check2 = check2?.S;
            check = check2;
        }
    }
    
    
    
    
    func Clear (scene:SKScene)
    {
        
        
        for cube in timeNodes
        {
            cube.removeFromParent()
        }
        
        
    }
    
    
    
    
    
    
    
    func PrintPole(scene:SKScene)
    {

        
        var cube:SKSpriteNode;

//        cube.removeFromParent()
        
        var X:Int = 169 ;
        var Y:Int = -290;
        
        var check:Cube? = startFirst;
        var check2:Cube? = startFirst;

        
        
       
        while (check2 != nil)
        {
            while (check != nil)
            {
                if(check?.Color=="green"){
                    
                    cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 20, height: 20))
                    cube.position = CGPoint(x:X , y:Y)
                    scene.addChild(cube)
                    timeNodes.append(cube)
                }
                else if check?.Color=="red"{
                    
                 
                    cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 20, height: 20))
                    cube.position = CGPoint(x:X , y:Y)
                    scene.addChild(cube)
                    timeNodes.append(cube)
                }
                else if check?.Color=="blue"{
                    
                  
                    cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 20, height: 20))
                    cube.position = CGPoint(x:X , y:Y)
                    scene.addChild(cube)
                    timeNodes.append(cube)
                }
                else if check?.Color=="yellow"{
                    
                    
                    cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 20, height: 20))
                    cube.position = CGPoint(x:X , y:Y)
                    scene.addChild(cube)
                    timeNodes.append(cube)
                }
                else if check?.Color=="orange"{
                    
                   
                    cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 20, height: 20))
                    cube.position = CGPoint(x:X , y:Y)
                    scene.addChild(cube)
                    timeNodes.append(cube)
                }
                
                
                X-=20
                check = check?.E;
            }

            X = 169;
            Y += 20;
            check2 = check2?.S;
            check = check2;
        }
        
    }
    
    
    
    
    
    func getColors(mass:[String]) -> [String] {
        
        var color: [String] = [];
        for t in mass
        {
            if t != startFirst.Color && t != startSecond.Color
            {
                color.append(t);
                
            }
        }
        return color
    }
    
    
    
    
    
    func showPlayerPanel(colors: [String] , scene:SKScene ){
        
        
        if whichStep == 1{
            
            //first: 119 -334   |  -1 -334   |  -121 -334
            
            if colors[0] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.name = "red"
                cube.position = CGPoint(x:119 , y:-334)
                scene.addChild(cube)
                menuNodes.append(cube)
                
                
            }
            else if colors[0]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.name = "green"
                cube.position = CGPoint(x:119 , y:-334)
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[0]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                 cube.name = "orange"
                cube.position = CGPoint(x:119 , y:-334)
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[0]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:-334)
                 cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[0]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:-334)
                 cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            
            
            
            
            
            
            
            
            
            if colors[1] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:-334)
                 cube.name = "red"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[1]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:-334)
                 cube.name = "green"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[1]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:-334)
                 cube.name = "orange"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[1]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:-334)
                 cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[1]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:-334)
                 cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            
            
            
            
            if colors[2] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:-334)
                 cube.name = "red"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[2]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:-334)
                 cube.name = "green"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[2]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:-334)
                 cube.name = "orange"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[2]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:-334)
                 cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[2]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:-334)
                 cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            
            
            
            
            
            
            
        }
        else{
            
            
            
            
            // 119 334  |  -1 334  |  -121 334
            
            
            
            if colors[0] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:334)
                cube.name = "red"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[0]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:334)
                cube.name = "green"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[0]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:334)
                cube.name = "orange"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[0]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:334)
                cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[0]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:119 , y:334)
                cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            
            
            
            
            
            
            
            
            
            if colors[1] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:334)
                cube.name = "red"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[1]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:334)
                cube.name = "green"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[1]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:334)
                cube.name = "orange"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[1]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:334)
                cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[1]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-1 , y:334)
                cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            
            
            
            
            if colors[2] == "red"{
                
                let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:334)
                cube.name = "red"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[2]  == "green"{
                
                
                let cube = SKSpriteNode(color: UIColor.green, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:334)
                cube.name = "green"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
                
            else if colors[2]  == "orange"{
                
                let cube = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:334)
                cube.name = "orange"
                scene.addChild(cube)
                menuNodes.append(cube)
                
            }
            else if colors[2]  == "blue"{
                
                let cube = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:334)
                cube.name = "blue"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
            else if colors[2]  == "yellow"{
                
                let cube = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 120, height: 68))
                cube.position = CGPoint(x:-121 , y:334)
                cube.name = "yellow"
                scene.addChild(cube)
                menuNodes.append(cube)
            }
        }
    }
    
    
    
    
    func ClearMenu(scene:SKScene){
        
        for cube in menuNodes
        {
            cube.removeFromParent()
        }

    }
    
    
    func GetWinner( scene:SKScene){    //  -1 -184   -1 184   416 368
        
        if(count > count2){
            
            let cube = SKSpriteNode(color: UIColor.white, size: CGSize(width: 416, height: 368))
            cube.position = CGPoint(x:-1 , y:-184)
            cube.zPosition = 99
            scene.addChild(cube)
            
            let cube2 =  SKSpriteNode(color: UIColor.black, size: CGSize(width: 416, height: 368))
            cube2.position = CGPoint(x:-1 , y:184)
            cube2.zPosition = 99
            scene.addChild(cube2)
        }
        else if (count2 > count){
            
            let cube = SKSpriteNode(color: UIColor.black, size: CGSize(width: 416, height: 368))
            cube.position = CGPoint(x:-1 , y:-184)
            cube.zPosition = 99
            scene.addChild(cube)
            
            let cube2 =  SKSpriteNode(color: UIColor.white, size: CGSize(width: 416, height: 368))
            cube2.position = CGPoint(x:-1 , y:184)
            cube2.zPosition = 99
            scene.addChild(cube2)
        }
        else if (count2 == count){
            
            
            let cube = SKSpriteNode(color: UIColor.black, size: CGSize(width: 417, height: 737))
            cube.position = CGPoint(x:-1 , y:-1  )
            cube.zPosition = 99
            scene.addChild(cube)
   
        }
    }
    
    func PlayerTimer(scene: SKScene , mass:[String] , thread: DispatchQueue){

//        let thread = DispatchQueue.global(qos: .userInteractive)

        
            if self.whichStep == 1{    //360 68    -1 334  -1 -334(firs)
                
                label = SKLabelNode(text: "00:05")
                label.color = UIColor.white
                label.fontSize = 48
                label.fontName = "Helvetica Neue"
                label.position = CGPoint(x:0 , y:318)
                
               // let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 360, height: 68))
                cube.name = "red"
                cube.position = CGPoint(x:-1 , y:334)
                scene.addChild(label)
                scene.addChild(cube)
                sleep(1)
                label.text = "00:04"
                sleep(1)
                label.text = "00:03"
                sleep(1)
                label.text = "00:02"
                sleep(1)
                label.text = "00:01"
                sleep(1)
                label.text = "00:00"
                label.removeFromParent()
                cube.removeFromParent()
                whichStep = 2;
                ClearMenu(scene: scene)
                showPlayerPanel(colors:  getColors(mass: mass) , scene: scene)
                
                
            }
            else{
                label = SKLabelNode(text: "00:05")
                label.color = UIColor.white
                label.fontSize = 48
                label.fontName = "Helvetica Neue"
                label.position = CGPoint(x:0 , y:-348)
                
               // let cube = SKSpriteNode(color: UIColor.red, size: CGSize(width: 360, height: 68))
                cube.name = "red"
                cube.position = CGPoint(x:-1 , y:-334)
                scene.addChild(label)
                scene.addChild(cube)
                sleep(1)
                label.text = "00:04"
                sleep(1)
                label.text = "00:03"
                sleep(1)
                label.text = "00:02"
                sleep(1)
                label.text = "00:01"
                sleep(1)
                label.text = "00:00"
                label.removeFromParent()
                cube.removeFromParent()
                whichStep = 1;
                ClearMenu(scene: scene)
                showPlayerPanel(colors:  getColors(mass: mass) , scene: scene)
                
            }
            
        
        label.text = "00:05"
        thread.async{
            
            self.PlayerTimer(scene: scene  , mass: mass , thread: thread)
            thread.suspend()
        }
        

        
       
        
        
    }
    
    
    
    
}
    
    
    
    
    


