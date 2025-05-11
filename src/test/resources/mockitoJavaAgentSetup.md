# Running Tests with Mockito Java Agent

## Problem

In JDK 21 (and future versions), Java is restricting the dynamic loading of agents at runtime. Mockito
historically has used agent-based class instrumentation but loaded the agent dynamically, which causes
the warning:
