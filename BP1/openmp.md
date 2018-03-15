# Needs-to-know

+ Each thread has a unique integer “id”; master thread has “id” 0, and other threads have “id” 1, 2, ...

+ OpenMP runtime function  `omp_get_thread_num()` returns a thread’s unique “id”.

+ The function `omp_get_num_threads()` returns the total number of executing threads

+ The function `omp_set_num_threads(x)`asks for “x” threads to execute in the next parallel region (must be set outside region)

+ Global variables (declared outside the scope of a parallel region) are shared among threads unless explicitly made private

+ Automatic variables declared within parallel region scope are private

+ Stack variables declared in functions called from within a parallel region are private

+ The master construct does not imply a barrier. This construct is very similar to the single construct: the code inside the master construct is executed by only one (master) thread. But the difference is that the master construct does not imply a barrier while the single construct does.

+ Some constructs support the removal of a barrier, for instance the loop construct. A programmer can then omit the barrier by adding nowait clause to the loop construct.

~~~c
#pragma omp parallel
{
    #pragma omp for nowait
    for (...)
    {
        // for loop body
    }

    // next instructions
}
~~~

>`#pragma  omp  parallel  private(x)`
+ Each thread receives its own uninitialized variable x
+ The variable x falls out-of-scope after the parallel region
+ A global variable with the same name is unaffected  (3.0 and later)

> `#pragma  omp  parallel  firstprivate(x)`
+ x must be a global-scope variable
+ Each thread receives a by-value copy of x
+ The local x’s fall out-of-scope after the parallel region
+ The base global variable with the same name is unaffected

+ Para distribuir las iteraciones de un bucle entre las threads (paralelismo de datos): `#pragma omp for`

+ Para distribuir trozos de código independientes entre las threads (paralelismo de tareas): `#pragma omp sections`

+ Para que uno de los threads ejecute un trozo de código secuencial: `#pragma omp single`

# Hello-worlds in OpenMp

~~~c
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define PARENT_TID 0

int main() {
  int tid;
  #pragma omp parallel
  {
    tid = omp_get_thread_num();
    if(tid == PARENT_TID)
      printf("Parent: %d threads running\n", omp_get_num_threads());
    else
      printf("Thread# %d: Hello world\n", tid);
  }
}
~~~

~~~c
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[]){
int nthreads, tid;

/* Fork a team of threads giving them their own copies of variables* /
#pragma omp parallel private(nthreads, tid)
  {

  /* Obtain thread number * /
  tid = omp_get_thread_num();
  printf("Hello World from thread = %d\n", tid);

  /* Only master thread does this * /
  if (tid == 0){
    nthreads = omp_get_num_threads();
    printf("Number of threads = %d\n", nthreads);
  }

  }  /* All threads join master thread and disband * /

}
~~~

#pragma omp parallel
Parameters
clause is any of the following clauses:

if (exp)
    When the if argument is specified, the program code executes in parallel only if the scalar expression represented by exp evaluates to a nonzero value at run time. Only one if clause can be specified.
private (list)
    Declares the scope of the data variables in list to be private to each thread. Data variables in list are separated by commas.
firstprivate (list)
    Declares the scope of the data variables in list to be private to each thread. Each new private object is initialized with the value of the original variable as if there was an implied declaration within the statement block. Data variables in list are separated by commas.
num_threads (int_exp)
    The value of int_exp is an integer expression that specifies the number of threads to use for the parallel region. If dynamic adjustment of the number of threads is also enabled, then int_exp specifies the maximum number of threads to be used.
shared (list)
    Declares the scope of the comma-separated data variables in list to be shared across all threads.
default (shared | none)
    Defines the default data scope of variables in each thread. Only one default clause can be specified on an omp parallel directive.

    Specifying default(shared) is equivalent to stating each variable in a shared(list) clause.

    Specifying default(none) requires that each data variable visible to the parallelized statement block must be explcitly listed in a data scope clause, with the exception of those variables that are:

        const-qualified,
        specified in an enclosed data scope attribute clause, or,
        used as a loop control variable referenced only by a corresponding omp for or omp parallel for directive.

copyin (list)
    For each data variable specified in list, the value of the data variable in the master thread is copied to the thread-private copies at the beginning of the parallel region. Data variables in list are separated by commas.

    Each data variable specified in the copyin clause must be a threadprivate variable.
reduction (operator: list)
    Performs a reduction on all scalar variables in list using the specified operator. Reduction variables in list are separated by commas.
    A private copy of each variable in list is created for each thread. At the end of the statement block, the final values of all private copies of the reduction variable are combined in a manner appropriate to the operator, and the result is placed back in the original value of the shared reduction variable. For example, when the max operator is specified, the original reduction variable value combines with the final values of the private copies by using the following expression:

    original_reduction_variable = original_reduction_variable < private_copy ?
    private_copy : original_reduction_variable;
    copy to clipboard

    For variables specified in the reduction clause, they must satisfy the following conditions:

        Must be of a type appropriate to the operator. If the max or min operator is specified, the variables must be one of the following types with or without long, short, signed, or unsigned:
            _ Bool
            char
            int
            float
            double
        Must be shared in the enclosing context.
        Must not be const-qualified.
        Must not have pointer type.

Usage

When a parallel region is encountered, a logical team of threads is formed. Each thread in the team executes all statements within a parallel region except for work-sharing constructs. Work within work-sharing constructs is distributed among the threads in a team.

Loop iterations must be independent before the loop can be parallelized. An implied barrier exists at the end of a parallelized statement block.

By default, nested parallel regions are serialized.
