#!/bin/bash
#check for wechat-spider running process
#
bin_dir="/home/wechat-spider/bin"
PROCESS_NUM=$(ps -ef | grep "python $bin_dir/processor.py" | grep -v "grep"| wc -l)
if [ $PROCESS_NUM -gt 0 ]; then
   echo "ok"
else
	nohup python $bin_dir/processor.py > $bin_dir/processor.log 2> $bin_dir/processor_error.log & 
	echo "Processor restarted"
fi

PROCESS_NUM=$(ps -ef | grep "python $bin_dir/scheduler.py" | grep -v "grep"| wc -l)
if [ $PROCESS_NUM -gt 0 ]; then
   echo "ok"
else
	nohup python $bin_dir/scheduler.py > $bin_dir/scheduler.log 2> $bin_dir/scheduler_error.log & 
	echo "scheduler restarted"
fi

PROCESS_NUM=$(ps -ef | grep "python $bin_dir/extractor.py" | grep -v "grep"| wc -l)
if [ $PROCESS_NUM -gt 0 ]; then
   echo "ok"
else
	nohup python $bin_dir/extractor.py > $bin_dir/extractor.log 2> $bin_dir/extractor_error.log & 
	echo "extractor restarted"
fi


PROCESS_NUM=$(ps -ef | grep "python $bin_dir/downloader.py" | grep -v "grep"| wc -l)
if [ $PROCESS_NUM -gt 0 ]; then
   echo "ok"
else
	nohup python $bin_dir/downloader.py > $bin_dir/downloader.log 2> $bin_dir/downloader_error.log & 
	echo "downloader restarted"
fi
