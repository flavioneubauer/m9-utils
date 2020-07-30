#!/bin/bash

# m9-times: sum-up all time for the task ( task is with like, so a % can group a project for instance )

TASK="$1"
psql -U postgres -t -d timesheet -c "select sum(e.elapsed) from executions e join tasks t on e.task_id = t.id where t.name like '$TASK'";
