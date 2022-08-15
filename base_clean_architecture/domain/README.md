# domain
Domain is the module where all the business rules are defined. 
It is a module that is independent of the development platform i.e. it is written purely in the Dart and does not contain any elements from the Flutter framework. 
All the use cases, entities, etc. are defined in this module. As the core module, this is also an independent module. 
One important thing to keep in mind is this module defines only the abstraction of the business rules. Implementation of this module is defined in the data module.
