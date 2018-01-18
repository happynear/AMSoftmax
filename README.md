# Additive Margin Softmax for Face Verification 

by Feng Wang, Weiyang Liu, Haijun Liu, Jian Cheng

The paper is available as a technical report at [arXiv](https://arxiv.org/abs/1801.05599).

### Introduction

![FeatureVis](assets/FeatureVis.png)

In this paper, we propose a conceptually simple and geometrically interpretable objective function, i.e. additive margin Softmax (AM-Softmax), for deep face verification. In general, the face verification task can be viewed as a metric learning problem, so learning large-margin face features whose intra-class variation is small and inter-class difference is large is of great importance in order to achieve good performance. Recently, Large-margin Softmax and Angular Softmax have been proposed to incorporate the angular margin in a multiplicative manner. In this work, we introduce a novel additive angular margin for the Softmax loss, which is intuitively appealing and more interpretable than the existing works. We also emphasize and discuss the importance of feature normalization in the paper. Most importantly, our experiments on LFW BLUFR and MegaFace show that our additive margin softmax loss consistently performs better than the current state-of-the-art methods using the same network architecture and training dataset.

### Citation
If you find **AM-Softmax** useful in your research, please consider to cite:

	@article{Wang_2018_amsoftmax,
	  title = {Additive Margin Softmax for Face Verification},
	  author = {Feng Wang, Weiyang Liu, Haijun Liu, Jian Cheng},
	  journal = {arXiv preprint arXiv:1801.05599},
	  year = {2018}
	}

### Training

**Requirements:** My caffe version https://github.com/happynear/caffe-windows.

The prototxt file is in `./prototxt`. The batch size is set to 256. If your GPU's memory is not sufficient enough, you may set `iter_size: 2` in `face_solver.prototxt` and `batch_size: 128` in `face_train_test.prototxt`.

The dataset used for training is CASIA-Webface. We removed 59 identities that are duplicated with LFW (17) and MegaFace Set 1 (42). This is why the final inner-product layer's output is `10516`. The list of the duplicated identities can be found in https://github.com/happynear/FaceDatasets.

All other settings are the same with SphereFace. Please refer to the details in [SphereFace's repository](https://github.com/wy1iu/sphereface).

### Model and Training Log

Feature normalized, s=30, m=0.35: [OneDrive](https://stduestceducn-my.sharepoint.com/:u:/g/personal/201411020102_std_uestc_edu_cn/ER-9FNdXCXtPlZAwZQwFmW0BdMVUjG8_y9IodYfoHVYXSg?e=QBG13o), [Baidu Yun](https://pan.baidu.com/s/1hulG7QW) .

### Results
See our [arXiv technical report](https://arxiv.org/abs/1801.05599).
