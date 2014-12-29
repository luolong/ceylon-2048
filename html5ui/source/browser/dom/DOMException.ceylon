"""DOM operations only raise exceptions in "exceptional" circumstances,
   i.e., when an operation is impossible to perform (either for logical reasons,
   because data is lost, or because the implementation has become unstable).
   In general, DOM methods return specific error values in ordinary processing
   situations, such as out-of-bound errors when using [[NodeList]].

   Implementations should raise other exceptions under other circumstances.
   For example, implementations should raise an implementation-dependent exception
   if a `null` argument is passed when `null` was not expected.

   Some languages and object systems do not support the concept of exceptions.
   For such systems, error conditions may be indicated using native error reporting
   mechanisms. For some bindings, for example, methods may return error codes similar
   to those listed in the corresponding method descriptions.
   """
shared dynamic DOMException {

    "An integer indicating the type of error generated."
    see(`value \iExceptionCode`)
    shared formal Integer code;

}

