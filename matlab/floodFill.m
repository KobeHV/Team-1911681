function [ colored_Image] = floodFill( image, target_Loc_x, target_Loc_y, targetColor, replacementColor)
colored_Image = image;
global S
if (target_Loc_x >= 1) && (target_Loc_x <= size(image,1)) && (target_Loc_y >= 1) && (target_Loc_y <= size(image,2))
    if image(target_Loc_x,target_Loc_y) == targetColor
        s=[target_Loc_x;target_Loc_y];
        S=[S s];
        colored_Image(target_Loc_x,target_Loc_y) = replacementColor;
        [colored_Image]  = floodFill(colored_Image,target_Loc_x ,target_Loc_y + 1, targetColor, replacementColor); 
        [colored_Image] = floodFill(colored_Image,target_Loc_x + 1,target_Loc_y, targetColor, replacementColor);
        [colored_Image] = floodFill(colored_Image,target_Loc_x,target_Loc_y - 1, targetColor, replacementColor);
        [colored_Image] = floodFill(colored_Image,target_Loc_x - 1,target_Loc_y, targetColor, replacementColor);
    end

end


end