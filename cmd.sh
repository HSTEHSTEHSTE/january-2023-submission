# you can change cmd.sh depending on what type of queue you are using.
# If you have no queueing system and want to run on a local machine, you
# can change all instances 'queue.pl' to run.pl (but be careful and run
# commands one by one: most recipes will exhaust the memory on your
# machine).  queue.pl works with GridEngine (qsub).  slurm.pl works
# with slurm.  Different queues are configured differently, with different
# queue names and different ways of specifying things like memory;
# to account for these differences you can create and edit the file
# conf/queue.conf to match your queue's configuration.  Search for
# conf/queue.conf in http://kaldi-asr.org/doc/queue.html for more information,
# or search for the string 'default_config' in utils/queue.pl or utils/slurm.pl.

if [ "$(hostname -d)" == "cm.gemini" ];then
    #export train_cmd="queue.pl --config conf/coe_gpu_short.conf --mem 4G"
    export train_cmd="queue.pl --config conf/coe_gpu_long.conf --mem 4G"
    export cuda_cmd="queue.pl --config conf/coe_gpu_long.conf --mem 20G"
    export cuda_eval_cmd="queue.pl --config conf/coe_gpu_short.conf --mem 4G"
else
    export train_cmd="utils/retry.pl utils/queue.pl --mem 4G -l hostname=\"[bc][01]*\""
    #export cuda_cmd="queue.pl --mem 20G -l hostname=\"c[01]*\""
    #export cuda_cmd="utils/retry.pl utils/queue.pl --mem 8G -l hostname=\"c[01]*\""
    #export cuda_eval_cmd="$train_cmd"
    #export cpu_cmd="utils/queue.pl --mem 16G -l hostname=\"[bc][01]*\""
    #export cuda_cmd="utils/queue.pl --mem 16G -l hostname=\"b1[123456789]|c[01]*\""
    #export cpu_cmd="utils/retry.pl utils/queue.pl --mem 8G -l hostname=\"[bc][01]*\""
    #export cuda_cmd="utils/retry.pl utils/queue.pl --mem 8G -l hostname=\"b1[123456789]|c[01]*\""
    #export cuda_cmd="utils/retry.pl utils/queue.pl --mem 40G -l hostname=\"b1[123456789]|c[01]*\""
    export cuda_cmd="utils/retry.pl utils/queue.pl --mem 16G -l hostname=\"b1[123456789]|c[01]*\""
fi



