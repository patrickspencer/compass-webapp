class Problem < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :problem_template

  # combine problem info with its template info
  def self.create_problem_hash(problem)
    template = problem.problem_template
    compiled_value = ProblemTemplate.parse_value(template)[:output].read
    problem_hash = {
        id: problem.id,
        user_id: problem.user_id,
        template: template,
        template_id: template.id,
        template_value: template.value,
        template_value_compiled: compiled_value,
        template_major_topic: template.major_topic,
        template_minor_topic: template.minor_topic,
        template_tags: template.tags,
        seed: problem.seed
    }
    return problem_hash
  end

end
