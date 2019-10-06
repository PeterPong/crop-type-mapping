#!/usr/bin/env bash
epochs=50

#experiments=tumgaf_tum_transformer tumgaf_gaf_rnn_optical tumgaf_gaf_rnn_radar tumgaf_gaf_rnn_all tumgaf_tum_rnn tumgaf_gaf_rnn tumgaf_tum_tempcnn tumgaf_gaf_tempcnn tumgaf_tum_msresnet tumgaf_gaf_msresnet tumgaf_gaf_transformer
#tumgaf_tum_rnn tumgaf_tum_msresnet tumgaf_tum_tempcnn tumgaf_tum_transformer tumgaf_gaf_transformer_optical tumgaf_gaf_transformer_radar tumgaf_gaf_transformer_all

for seed in 0; do # 1 2 3 4 5 6 7 8 9 10; do
echo $seed
for experiment in tumgaf_gafall_rnn tumgaf_gafall_tempcnn; do
python train.py -x $experiment -e $epochs -b 96 -w 2 -i 0 --store /data/gaf/runsv3 --checkpoint_every_n_epochs 5 --test_every_n_epochs 1 --overwrite --no-visdom --seed $seed
done

done
