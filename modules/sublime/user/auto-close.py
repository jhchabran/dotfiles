import sublime_plugin
import sublime
import os

class MyEvents( sublime_plugin.EventListener ):
   def on_activated( self, view ):
      s = view.file_name()

      if s:
         if not os.path.exists( s ):
            if not "sublime-" in s:
               view.set_scratch( True )
               sublime.set_timeout(lambda: view.window().run_command("close_file"), 0)

