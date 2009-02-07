require 'irb'

class Idb
  VERSION = '0.0.1'

  def self.run(options = {})
    IRB.setup nil
    IRB.conf[:PROMPT][:IDB] = {
      :PROMPT_I => "idbI>> ",
      :PROMPT_N => "idbN> ",
      :PROMPT_S => "idbS> ",
      :PROMPT_C => "idbC> ",
    }
    irb = IRB::Irb.new
    IRB.conf[:MAIN_CONTEXT] = irb.context

    trap(:INT){irb.signal_handle}
    catch(:IRB_EXIT){irb.eval_input}
  end
end
