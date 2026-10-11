# Reflection (C2)

In A2, GOTO was useful for jumping out of a deeply nested loop once an error condition was found. It saved me from adding extra flags and made the exit path obvious. Where I used it for normal flow, it hurt readability: I had to trace labels up and down the block to follow the logic, and a structured IF or LOOP with EXIT would have been clearer.

A3 broke a scope rule because a variable was declared inside an inner block but referenced outside it, so the code failed to compile. I fixed it by declaring the variable in the outer block, where both parts of the code could see it. That kept the variable visible only where it was needed instead of making everything global.

Comparing A1 and A4, I would rather maintain A4. A1 works, but its logic is repeated in several places, so one change means editing many lines. A4 splits the work into named, reusable pieces, which makes it easier to test, read and fix. When I came back to A4 after a few days, I understood it quickly. A1 took longer to follow.

Exception handling made my functions in B4 and C1 more dependable. Without it, a problem such as NO_DATA_FOUND or a divide-by-zero would stop the whole program with an unhelpful error. With handlers, each function could return a sensible default or a clear message, and the caller could decide what to do next. It also made debugging easier because errors were reported where they happened.

The risk of calling a function in SELECT on a large table is that the function runs once per row. If it does its own queries, a million-row table means a million extra executions, and each switch between the SQL and PL/SQL engines adds overhead. This can make a query very slow. Where possible, I should use joins or set-based SQL instead, or at least keep the function light.

Next time I would plan the structure before writing code, avoid GOTO unless it clearly helps, and test my functions on larger data earlier so performance problems show up sooner.

