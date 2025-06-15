{ pkgs, lib, ... }:
{
  programs.fish.functions = {
    actions = ''
      function actions
        switch $argv[1]
          case start
            tmux new -d -s github-runner "cd ~/.local/actions-runner && ./run.sh"
            echo "Runner started"
          case stop
            tmux kill-session -t github-runner
            echo "Runner stopped"
          case status
            tmux has-session -t github-runner 2>/dev/null
            if test $status -eq 0
              echo "Runner is running"
              tmux list-sessions | grep github-runner
            else
              echo "Runner is not running"
            end
          case attach
            tmux attach -t github-runner
          case '*'
            echo "Usage: runner [start|stop|status|attach]"
        end
      end
    '';
  };
}
