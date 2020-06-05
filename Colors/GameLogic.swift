//
//  GameLogic.swift
//  Colors
//
//  Created by Николай Владимирович Крайнюк on 7/23/19.
//  Copyright © 2019 Николай Владимирович Крайнюк. All rights reserved.
//

import SpriteKit

class GameLogic: SKScene {

    
    class Program
    {
        
        func Main()
        {
            let p = Pole (width:5 , height:10);
            RunGame( p:p )
        }
        
        func RunGame( p:Pole )
        {
            
            p.PrintPole();
            print();
            print("У первого игрока цвет: \(String(describing: p.startFirst.Color)) и очков: \(p.count)");
            print("У второго игрока цвет: \(String(describing: p.startSecond.Color)) и очков: \(p.count2)");
            print("Первый игрок выберите цвет");
            
            var color:String = readLine()!;
            p.timeO4ko = 0;
            p.MeanColorFromFirst(cube:p.startFirst, newcolor:color );
            p.VisitNull();
            p.CalculateCountFirst(cube:p.startFirst, newcolor:color);
            p.VisitNull();
            
            p.count = p.timeO4ko;
            p.timeO4ko = 0;
            
            print();
            p.PrintPole();
            print();
            if (p.count > (p.Width * p.Height) / 2)
            {
                print("Первый игрок победил");
                p.status = 0;
            }
            else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
            {
                print("Ничья!");
                p.status = 0;
            }
            
            
            p.FirstOldColor = color;
            
            
            if (p.status != 0)
            {
                print("У первого игрока цвет: \(String(describing: p.startFirst.Color)) и очков: \(p.count)");
                print("У второго игрока цвет: \(String(describing: p.startSecond.Color)) и очков: \(p.count2)");
                print("Второй игрок выберите цвет");
                
                color = readLine()!;
                p.timeO4ko2 = 0;
                p.MeanColorFromSecond( cube:p.startSecond, newcolor:color );
                p.VisitNull();
                p.CalculateCountSecond(cube:p.startSecond, newcolor:color);
                p.VisitNull();
                
                
                
                p.count2 = p.timeO4ko2;
                p.timeO4ko2 = 0;
                print();
                p.PrintPole();
                print();
                
                if (p.count2 > (p.Width * p.Height) / 2)
                {
                    print("Второй игрок победил");
                    p.status = 0;
                }
                else if ( (p.count ==  (p.Width * p.Height) / 2) && p.count == p.count2)
                {
                    print("Ничья!");
                    p.status = 0;
                }
                
                
                p.SecondOldColor = color;
                if (p.status != 0)
                {
                    RunGame(p:p);
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
        
        
        
        init(  width:Int , height:Int )
        {
            Width = width;
            Height = height;
            startFirst = Cube();
            var colors: [String] = ["Red   ", "Yellow", "Blue  ", "Green ", "Orange"]
            
            
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
            
            startSecond = (cubeNow.E?.E?.E?.E)!;
            
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
        
        
        
        
        func PrintPole()
        {
            
            var check:Cube? = startFirst;
            var check2:Cube? = startFirst;
            var str:String = "";
            
            print();
            while (check2 != nil)
            {
                while (check != nil)
                {
                    str += check!.Color!;
                    check = check?.E;
                }
                print(str)
                str = "";
                print();
                check2 = check2?.S;
                check = check2;
            }
            
        }
    }
    
    
}
