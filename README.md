# Additive Margin Softmax for Face Verification 

by Feng Wang, Weiyang Liu, Haijun Liu, Jian Cheng

# Training

**Requirements:** My caffe version https://github.com/happynear/caffe-windows.

The prototxt file is in `./prototxt`. The batch size is set to 256. If your GPU's memory is not sufficient enough, you may set `iter_size: 2` in `face_solver.prototxt` and `batch_size: 128` in `face_train_test.prototxt`.

The dataset used for training is CASIA-Webface. We removed 59 identities that are duplicated with LFW (17) and MegaFace Set 1 (42). This is why the final inner-product layer's output is `10516`. The list of the duplicated identities can be found in https://github.com/happynear/FaceDatasets.

All other settings are the same with SphereFace. Please refer to the details in [SphereFace's repository](https://github.com/wy1iu/sphereface).
