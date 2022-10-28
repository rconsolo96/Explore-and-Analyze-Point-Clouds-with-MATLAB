function [pCloud, pCloud_DownSampled] = GenerateSamplePointClouds


    %% Create Sample Map For the Point Cloud Navigation and Processing Apps
    MAP = [];
    
    %% Add Ground Plane
    
    [X,Y] = meshgrid(0:0.1:100);
    nPF = numel(X);
    Floor = [X(:), Y(:), zeros(nPF,1)];
    MAP = [MAP;Floor];
    COLOR = repmat([0,100,0], nPF, 1);
    
    %% Add Street
    
    % Plane Template
    [X,Y,Z] = meshgrid(0:0.001:1, 0:0.01:1, 0:0.1:1);
    X = X(:); Y = Y(:); Z = Z(:);
    % Road 
    Size = [100, 10, 0.2];
    Shift = [0, 45, 0];
    Plane = Size .* [X, Y, Z] + Shift;
    MAP = [MAP;Plane];
    COLOR = [COLOR; repmat([192, 192, 192], length(X), 1)];
    % Sidewalks
    Size = [100, 2.5, 0.3];
    Shift = [0, 42.5, 0];
    Side = Size .* [X, Y, Z] + Shift;
    MAP = [MAP;Side];
    COLOR = [COLOR; repmat([128, 128, 128], length(X), 1)];
    Shift = [0, 55, 0];
    Side = Size .* [X, Y, Z] + Shift;
    MAP = [MAP;Side];
    COLOR = [COLOR; repmat([128, 128, 128], length(X), 1)];
    
    
    %% Add Cars
    
    % Template Sphere
    nFS = 100;
    [Xs,Ys,Zs] = sphere(nFS);
    Xs = Xs(:); Ys = Ys(:); Zs = Zs(:);
    % Plane Template
    [X,Y,Z] = meshgrid(0:0.01:1, 0:0.01:1, 0:0.01:1);
    X = X(:); Y = Y(:); Z = Z(:);
    
    % Set of Wheels
    sPoints = length(Xs);
    Radius = 0.3;
    sShift = [0, 0, 0.6];
    CarX = 4;
    CarY = 2;
    
    % Chassis
    nPoints = length(X);
    SizeBot = [5, 3, 1];
    SizeTop = [4, 2, 1];
    CarColor = [255, 0, 0
                0, 0, 255
                255, 128, 0
                0, 255, 0
                150, 0, 150
                255, 255, 0];
    
    XShifts = [10, 30, 80, 20, 70, 90];
    YShifts = [46, 46, 46, 52, 52, 52];
    
    
    for i = 1:length(XShifts)
        %Wheel1
        sShift(1:2) = [XShifts(i), YShifts(i)];
        Sphere = Radius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([64, 64, 64], sPoints, 1)];
        
        %Wheel2
        sShift(1:2) = [XShifts(i), YShifts(i)+CarY];
        Sphere = Radius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([64, 64, 64], sPoints, 1)];
        
        %Wheel3
        sShift(1:2) = [XShifts(i)+CarX, YShifts(i)];
        Sphere = Radius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([64, 64, 64], sPoints, 1)];
        
        %Wheel4
        sShift(1:2) = [XShifts(i)+CarX, YShifts(i)+CarY];
        Sphere = Radius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([64, 64, 64], sPoints, 1)];
    
        %Bottom Body
        Shift = [XShifts(i)-0.5, YShifts(i)-0.5, 0.9];
        Plane = SizeBot .* [X, Y, Z] + Shift;
        MAP = [MAP;Plane];
        COLOR = [COLOR; repmat(CarColor(i,:), nPoints, 1)];
        
        % Top Body
        Shift = [XShifts(i), YShifts(i), 1.9];
        Plane = SizeTop .* [X, Y, Z] + Shift;
        MAP = [MAP;Plane];
        COLOR = [COLOR; repmat(CarColor(i,:), nPoints, 1)];
    end
    
    
    %% Add trees
    
    % Template Cylinder
    rC = ones(100,1);
    nPC = 100;
    [X,Y,Z] = cylinder(rC, nPC);
    X = X(:); Y = Y(:); Z = Z(:);
    % Template Sphere
    nFS = 100;
    [Xs,Ys,Zs] = sphere(nFS);
    Xs = Xs(:); Ys = Ys(:); Zs = Zs(:);
    
    % Short Trees
    Radius = 0.5;
    Height = 3;
    Size = [Radius, Radius, Height];
    sRadius = 1;
    
    XShifts = [20, 60, 80, 30, 10];
    YShifts = [20, 30, 10, 70, 90];
    
    for i = 1:length(XShifts)
        Shift = [XShifts(i), YShifts(i), 0.1];
        Cylinder = Size .* [X, Y, Z] + Shift;
        MAP = [MAP; Cylinder];
        COLOR = [COLOR; repmat([102, 51, 0], length(X), 1)];
    
        sShift = [XShifts(i), YShifts(i), Height+0.7];
        Sphere = sRadius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([0, 204, 0], length(Xs), 1)];
    end
    
    
    % Tall Trees
    Radius = 0.5;
    Height = 5;
    Size = [Radius, Radius, Height];
    sRadius = 1;
    
    XShifts = [30, 50, 90, 60, 80];
    YShifts = [30, 10, 30, 80, 70];
    
    for i = 1:length(XShifts)
        Shift = [XShifts(i), YShifts(i), 0.1];
        Cylinder = Size .* [X, Y, Z] + Shift;
        MAP = [MAP; Cylinder];
        COLOR = [COLOR; repmat([102, 51, 0], length(X), 1)];
    
        sShift = [XShifts(i), YShifts(i), Height+0.7];
        Sphere = sRadius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([0, 204, 0], length(Xs), 1)];
    end
    
    % Tall & Wide Trees
    Radius = 1;
    Height = 5;
    Size = [Radius, Radius, Height];
    sRadius = 1.5;
    
    XShifts = [10, 70, 30, 90, 50];
    YShifts = [40, 20, 90, 90, 60];
    
    for i = 1:length(XShifts)
        Shift = [XShifts(i), YShifts(i), 0.1];
        Cylinder = Size .* [X, Y, Z] + Shift;
        MAP = [MAP; Cylinder];
        COLOR = [COLOR; repmat([102, 51, 0], length(X), 1)];
    
        sShift = [XShifts(i), YShifts(i), Height+1];
        Sphere = sRadius .* [Xs,Ys,Zs] + sShift;
        MAP = [MAP; Sphere];
        COLOR = [COLOR; repmat([0, 204, 0], length(Xs), 1)];
    end
    
    
    
    %% Convert to Point Cloud Object and Display 
    
    pCloud = pointCloud(MAP);
    pCloud.Color = uint8(COLOR);
    
    %% Generate Down Sampled Point Cloud and Display
    
    pCloud_DownSampled = pcdownsample(pCloud, "random", 0.3); % 30% of the original points

end


