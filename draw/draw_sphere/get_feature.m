clear all;
caffe.set_mode_gpu();
caffe.reset_all();
net = caffe.Net('./lenet_draw.prototxt','./lenet_iter_25000.caffemodel','train');%draw_fashion/0.5/
batch_size = 128;
all_feature = zeros(batch_size*100,3);
all_label = zeros(batch_size*100,1);

for i=1:100
    f = net.forward({});
    data_blob = net.blobs('ip1').get_data();
    label_blob = net.blobs('label').get_data();
    if size(data_blob,1) == 1 && size(data_blob,2) == 1
        data_blob = reshape(data_blob,[size(data_blob,3) size(data_blob,4)]);
    end;
    all_feature((i-1)*batch_size+1:i*batch_size,:) = data_blob';
    all_label((i-1)*batch_size+1:i*batch_size) = label_blob;
end;
% weight = reshape(net.blobs('id_weight').get_data(), [2,10]);

load jet.mat
% close(1);
figure(1);
all_feature = bsxfun(@rdivide, all_feature, sqrt(sum(all_feature.^2,2)));
[x,y,z] = sphere(3600);
c = y - z;
c = (c-min(c(:)))/(max(c(:))- min(c(:)));
s = surf(x*0.995,y*0.995,z*0.995,c,'FaceLighting','gouraud','AmbientStrength',0.5);
shading interp
mymap = repmat((0.95:-0.001:0.05)',1,3);
colormap(mymap);
% lightangle(-45,30)
% camlight('left','infinite')
alpha(s,.7)

hold on;
for l=0:9
    feature_l = all_feature(all_label==l,:);
    feature_l = feature_l(1:3:size(feature_l,1),:);
    scatter3(feature_l(:,1), feature_l(:,2), feature_l(:,3),ones(size(feature_l,1),1)*5,'MarkerFaceColor',jet(l * 6 + 1,:),'MarkerEdgeColor',jet(l * 6 + 1,:));
end;
% legend('sphere','0','1','2','3','4','5','6','7','8','9');

% for l=0:9
%     feature_l = all_feature(all_label==l,:);
% %     feature_l = feature_l(1:3:size(feature_l,1),:);
%     for f=1:size(feature_l,1)
%         line([0 feature_l(f,1)],[0 feature_l(f,2)],[0 feature_l(f,3)],'Color',[.9 .9 .9]);
%     end;
% end;
upper_bound = max(abs(all_feature(:))) * 1.2;

% for l=0:9
%     plot(weight(1,l+1) * upper_bound /2 , weight(2,l+1) * upper_bound / 2,'x','MarkerSize',10);
% end;
% grid on;
% box on;
hold off;
axis([-upper_bound upper_bound -upper_bound upper_bound]);
axis off;
view(70,16);


% distance = pdist2(all_feature, weight');
