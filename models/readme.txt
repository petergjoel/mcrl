2021/06/10

* MODEL INTRODUCTION
- "mcrl_for_learning" is used for synthesizing strategies. It is used by q learning. 

line to run this model: verifyta -u -f output/trace -t1 mcrl_for_learning.xml -D 0.01 --learning-method -1 -s --max-iterations 30 --eval-runs 100 --good-runs 100 --total-runs 100 --reset-no-better 10 --max-reset-learning 3

- "mcrl_conductor" is for verification. It calls external library called "libconductor.so", where the synthesized strategies are compiled. One must specify the directory of the library in this model.
line to run this model: verifyta -u mcrl_conductor.xml

Please use the beta version of verifyta.

* TARGET INTRODUCTION
- The current Q-learning of MCRL (code: https://github.com/rgu01/mcrl) does not explore the state space as widely as the internal Q-learning does. The Q tables synthesized by MCRL are much shorter than the ones synthesized by the internal Q-learning. Why? How can we change MCRL to make it explore as widely as the internal Q-learning does? This is for the strategy-compacting goal.
- The conductor model enables us to simulate the model with strategies symbolically. However, when the conductor model is verified by "A<> ...", we are not sure if it behaves exactly the same as the original model being verified by "A<> ... under ...". It would be better to simulate the model by using UPPAAL STRATEGO itself. 

