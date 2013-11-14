module AddIgnoreSets
  def run_post_registration_hooks(job, params, reply_buffer)
    add_ignore_sets(job, params, reply_buffer)
    super
  end

  private

  def add_ignore_sets(job, params, reply_buffer)
    patterns = couchdb.patterns_in_ignore_sets(params['ignore_sets'])
    job.add_ignore_patterns(patterns)

    reply_buffer << "Added #{patterns.length} ignore patterns."
  end
end
