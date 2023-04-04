: << 'END'
declare -A di_scene_id_cam_ids
di_scene_id_cam_ids[313]=1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19_22_23
for scene_id in 313
do
    scene=CoreView_${scene_id}
    dir_in=/data/zju_mocap/${scene}/densepose_raw
    dir_out=/data/zju_mocap/${scene}/densepose
    cam_ids=${di_scene_id_cam_ids[${scene_id}]}
    python3 preprocess_densepose.py --seq_name ${scene} --dir_in ${dir_in} --dir_out ${dir_out} --cam_ids ${cam_ids}
done
END
#python3 train_net.py --cfg_file configs/cmu_exp/p4s6.yaml exp_name p4s6 resume False output_depth True
python3 train_net.py --cfg_file configs/zju_mocap_exp/313.yaml exp_name zju_313 resume False output_depth True
