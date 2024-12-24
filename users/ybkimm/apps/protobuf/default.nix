{ pkgs, ... }:
{
  home.packages = with pkgs; [
    buf
    grpcurl
    protoc-gen-connect-go
    protoc-gen-go
  ];
}
