module TaskHelper
  def self.state_labels
    states = []
    Task.state_machine.states.each { |state| states << [Task.human_state_name(state.name), state.name] }
    states
  end
end
