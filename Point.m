classdef Point
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        x;
        y;
        z;
        
        Length;
    end
    
    methods
        function l = get.Length(this)
            l = sqrt((this.x^2)+(this.y^2)+(this.z^2));
        end
        
        function this = Move(this, vec)
            this.x = this.x +vec(1);
            this.y = this.y +vec(2);
            this.z = this.z +vec(3);
        end
    end
    
end

