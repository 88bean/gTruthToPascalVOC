% Convert Matlab Lalbeling Session to a VOC Label

% Defina a fote dos dados
Fonte = 'Rollers'; 

len = size(gTruth.DataSource.Source,1);


for i=1:len
    
    path = gTruth.DataSource.Source{i}; % resgata o endereço completo da foto
    VOC.annotation.path.Text = path;
    % Separa o texto
    expression = '/';
    splitStr = regexp(path,expression,'split');    
    % Nome da foto
    foto = string(splitStr(size(splitStr,2)));
    VOC.annotation.filename.Text = char(foto); 
    % Localiza o diretório
    folder = string(splitStr(size(splitStr,2)-1));
    VOC.annotation.folder.Text = char(folder);  % Nome do diretório da foto
    VOC.annotation.source.database.Text = Fonte; % Define a Fonte dos dados
    % Características da Imagem
    [height, width, depth] = size(imread(path));
    VOC.annotation.size.width.Text = num2str(width);
    VOC.annotation.size.height.Text = num2str(height);
    VOC.annotation.size.depth.Text = num2str(depth);
    % Segmentação
    VOC.annotation.segmented.Text = '0';
    
    
    number_bboxes = size(gTruth.LabelData,2);
    a=1;
    for j=1:number_bboxes    
        if isempty(gTruth.LabelData{i,j}{1})
            continue;
        end    
        % Objetos - Boundboxes
            %Nome da Tag
        boxNum=size(gTruth.LabelData{i,j}{1},1);
        for k=1:boxNum
            box=gTruth.LabelData{i,j}{1}(k,:);
            VOC.annotation.object{1, a}.name.Text = gTruth.LabelData.Properties.VariableNames{j};
            VOC.annotation.object{1, a}.pose.Text = 'Unspecified'; 
            VOC.annotation.object{1, a}.truncated.Text = '0';
            VOC.annotation.object{1, a}.difficult.Text = '0';
            % Posição da BoundBox  [x,y,width, height]
            xmin = box(1); 
            ymin = box(2);
            xmax = xmin + box(3);
            ymax = ymin + box(4);
            VOC.annotation.object{1, a}.bndbox.xmin.Text = xmin;
            VOC.annotation.object{1, a}.bndbox.ymin.Text = ymin;
            VOC.annotation.object{1, a}.bndbox.xmax.Text = xmax;
            VOC.annotation.object{1, a}.bndbox.ymax.Text = ymax;
            a=a+1
        end    
    end
    
    expression = '\.';
    foto1 = regexp(foto,expression,'split');
    nome = sprintf('%s.xml',foto1(1));
    struct2xml(VOC,nome);
    clear VOC;
end

