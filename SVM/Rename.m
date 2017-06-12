% Get all pgm files in the current folder
for i = 14:14
   directory = strcat('./yaleBExtData/yaleB', num2str(i, '%02d'), '/');
   files = dir(strcat(directory, '*.pgm'));
   % Loop through each
   for id = 1: length(files)
       % get the file name (minus the extension)
       [~, f] = fileparts(files(id).name);
       movefile(strcat(directory, '/', files(id).name), strcat(directory, '/yaleB', num2str(i, '%02d'), '_', num2str(id, '%02d'), '.pgm'));
   end
end