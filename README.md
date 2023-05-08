# Att-SCINet

### Requirements

Install the required package first:

```
cd Att-SCINet
pip install -r requirements.txt
```

### Dataset preparation

All datasets can be downloaded. To prepare all dataset at one time, you can just run:
```
source prepare_data.sh
```

The data directory structure is shown as follows. 
```
./
└── datasets/
    ├── ETT-data
        ├── ETTh1.csv
        ├── ETTh2.csv
        └── ETTm1.csv
```

### Run training code

We follow the same settings of [SCINet](https://github.com/cure-lab/SCINet) for ETTH1, ETTH2, ETTM1 datasets. The detailed training commands are given as follows.

##### ETT Parameter highlights

| Parameter Name | Description                  | Parameter in paper | Default                    |
| -------------- | ---------------------------- | ------------------ | -------------------------- |
| root_path      | The root path of subdatasets | N/A                | './datasets/ETT-data/ETT/' |
| data           | Subdataset                   | N/A                | ETTh1                      |
| pred_len       | Horizon                      | Horizon            | 48                         |
| seq_len        | Look-back window             | Look-back window   | 96                         |
| batch_size     | Batch size                   | batch size         | 32                         |
| lr             | Learning rate                | learning rate      | 0.0001                     |
| hidden-size    | hidden expansion             | h                  | 1                          |
| levels         | SCINet block levels          | L                  | 3                          |
| stacks         | The number of SCINet blocks  | K                  | 1                          |
| attention      | Name of attention module     | N/A                | None                       |

#### For ETTH1 dataset:

multivariate, out 24
```
python run_ETTh.py --data ETTh1 --features M --attention CBAM  \
--seq_len 64 --label_len 24 --pred_len 24 --hidden-size 4 --stacks 1 --levels 3 --lr 3e-3 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```
multivariate, out 48
```
python run_ETTh.py --data ETTh1 --features M --attention CBAM  \
--seq_len 96 --label_len 48 --pred_len 48 --hidden-size 4 --stacks 1 --levels 3 --lr 0.009 --batch_size 512 --dropout 0.25 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 168
```
python run_ETTh.py --data ETTh1 --features M --attention CBAM  \
--seq_len 336 --label_len 168 --pred_len 168 --hidden-size 4 --stacks 1 --levels 4 --lr 5e-4 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 336
```
python run_ETTh.py --data ETTh1 --features M --attention CBAM  \
--seq_len 336 --label_len 336 --pred_len 336 --hidden-size 1 --stacks 1 --levels 4 --lr 1e-4 --batch_size 128 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 720
```
python run_ETTh.py --data ETTh1 --features M --attention CBAM  \
--seq_len 736 --label_len 720 --pred_len 720 --hidden-size 1 --stacks 1 --levels 5 --lr 5e-5 --batch_size 128 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

#### For ETTH2 dataset:

multivariate, out 24
```
python run_ETTh.py --data ETTh2 --features M --attention CBAM  \
--seq_len 64 --label_len 24 --pred_len 24 --hidden-size 8 --stacks 1 --levels 3 --lr 0.007 --batch_size 512 --dropout 0.25 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 48
```
python run_ETTh.py --data ETTh2 --features M --attention CBAM  \
--seq_len 192 --label_len 48 --pred_len 48 --hidden-size 4 --stacks 1 --levels 4 --lr 0.007 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 168
```
python run_ETTh.py --data ETTh2 --features M --attention CBAM  \
--seq_len 336 --label_len 168 --pred_len 168 --hidden-size 4 --stacks 1 --levels 4 --lr 5e-5 --batch_size 128 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10 --RIN True
```

multivariate, out 336
```
python run_ETTh.py --data ETTh2 --features M --attention CBAM  \
--seq_len 336 --label_len 336 --pred_len 336 --hidden-size 4 --stacks 1 --levels 4 --lr 5e-5 --batch_size 256 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10 --RIN True
```

multivariate, out 720
```
python run_ETTh.py --data ETTh2 --features M --attention CBAM  \
--seq_len 736 --label_len 720 --pred_len 720 --hidden-size 8 --stacks 1 --levels 5 --lr 1e-5 --batch_size 128 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10 --RIN True
```

#### For ETTM1 dataset:

multivariate, out 24
```
python run_ETTh.py --data ETTm1 --features M --attention CBAM  \
--seq_len 128 --label_len 24 --pred_len 24 --hidden-size 4 --stacks 1 --levels 3 --lr 0.005 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 48
```
python run_ETTh.py --data ETTm1 --features M --attention CBAM  \
--seq_len 192 --label_len 48 --pred_len 48 --hidden-size 4 --stacks 1 --levels 4 --lr 0.001 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 96
```
python run_ETTh.py --data ETTm1 --features M --attention CBAM  \
--seq_len 384 --label_len 96 --pred_len 96 --hidden-size 4 --stacks 1 --levels 4 --lr 5e-5 --batch_size 256 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10 --RIN True
```

multivariate, out 288
```
python run_ETTh.py --data ETTm1 --features M --attention CBAM  \
--seq_len 672 --label_len 288 --pred_len 288 --hidden-size 4 --stacks 1 --levels 5 --lr 1e-5 --batch_size 512 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10
```

multivariate, out 672
```
python run_ETTh.py --data ETTm1 --features M --attention CBAM  \
--seq_len 672 --label_len 672 --pred_len 672 --hidden-size 4 --stacks 1 --levels 5 --lr 1e-5 --batch_size 128 --dropout 0.5 \
--decompose True --train_epochs 200 --patience 10  --RIN True
```
