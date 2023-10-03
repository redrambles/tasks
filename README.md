Create a new Rails application

Implement a thing to store Tasks
Tasks can have a title, a due date and a completion status
Implement a JSON API that responds as follows

GET /tasks to return a list of all tasks # index

### -> What do we want to return? All properties, only some?

POST /tasks to create a new task # create

### -> Validations? What must we have? Default values?

PUT /tasks/:id to update a task # update

# completion == bool

# WRITE DOWN THE FUCKING PLAN

# ASK QUESTIONS

Often the questions are purposely vague to prompt you to ask questions

# VAlidations (default values) - attributes for the task

# If unsure how a thing works, don't open a can of worms in an interview (Is it acceptable for this to be a boolean at the moment)

# TAlk about the shape of the JSON SHAPE

Should all those be exposed to the client
What do the JSON object look like for the API - both in terms of input and of output

Often times for rails -

.all -> for an actual application
In a real world application we would need to talk about pagination - otherwise 'all' is unbounded

CLARIFY THE SPECSSSSS

# Figure out what the expansion this is and disable it

# Make sure environment is clean - no application is working

# Change the JSON shape so that it doesn't include created_at or updated_at
