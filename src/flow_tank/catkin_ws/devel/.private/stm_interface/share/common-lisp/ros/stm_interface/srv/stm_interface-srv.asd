
(cl:in-package :asdf)

(defsystem "stm_interface-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RelayControl" :depends-on ("_package_RelayControl"))
    (:file "_package_RelayControl" :depends-on ("_package"))
  ))