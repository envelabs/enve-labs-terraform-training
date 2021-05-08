### infra map for single instance

    |- main.tf
      - vars.tf
      - security-groups.tf
      - instances.tf
      - r53.tf
      - outputs.tf

### infra map for multiple instances with lc and asg

    |- main.tf
      - vars.tf
      - security-groups.tf
      - lc.tf
      - asg.tf
      - outputs.tf

### infra map for multiple instances with lc and asg

    |- main.tf
        - vars.tf
        - security-groups.tf
        - lc.tf
        - asg.tf
        - elb-security-groups.tf
        - elb.tf
        - r53.tf
