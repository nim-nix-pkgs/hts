{
  description = ''hts (bam/sam) for nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-hts-v0_2_11.flake = false;
  inputs.src-hts-v0_2_11.ref   = "refs/tags/v0.2.11";
  inputs.src-hts-v0_2_11.owner = "brentp";
  inputs.src-hts-v0_2_11.repo  = "hts-nim";
  inputs.src-hts-v0_2_11.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-hts-v0_2_11"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-hts-v0_2_11";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}