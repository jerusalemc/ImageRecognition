for i = 1:38
    for j = 1:59
        file = strcat('./yaleBExtData/yaleB', num2str(i, '%02d'), '/', 'yaleB', num2str(i, '%02d'), '_', num2str(j, '%02d'), '.pgm');
        mkdir(strcat('./Sample/yaleB', num2str(i, '%02d')))
        newfile = strcat('./Sample/yaleB', num2str(i, '%02d'), '/', 'yaleB', num2str(i, '%02d'), '_', num2str(j, '%02d'), '.pgm');
        data = imread(file);
        [row, column, z] = size(data);
        newdata = data(1:4:row, 1:4:column, :);
        imwrite(newdata, newfile);
    end
end