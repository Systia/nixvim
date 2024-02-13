{
  plugins.mini = {
    enable = true;
    modules = {
      indentscope = { };
      move = { };
      trailspace = { };
      cursorword = { };
      hipatterns = {
        highlighters = {
          fixme = {
            pattern = "%f[%w]()FIXME()%f[%W]";
            group = "MiniHipatternsFixme";
          };
          hack = {
            pattern = "%f[%w]()HACK()%f[%W]";
            group = "MiniHipatternsHack";
          };
          todo = {
            pattern = "%f[%w]()TODO()%f[%W]";
            group = "MiniHipatternsTodo";
          };
          note = {
            pattern = "%f[%w]()NOTE()%f[%W]";
            group = "MiniHipatternsNote";
          };
          hex_color = "hipatterns.gen_highlighter.hex_color()";
        };
      };
    };
  };

  highlightOverride = {
    MiniCursorword = {
      underline = true;
      bg = "NONE";
    };
    MiniCursorwordCurrent = {
      underline = true;
      bg = "NONE";
    };
  };
}
