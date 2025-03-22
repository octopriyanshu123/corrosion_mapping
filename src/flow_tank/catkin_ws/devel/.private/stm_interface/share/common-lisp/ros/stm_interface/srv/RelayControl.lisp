; Auto-generated. Do not edit!


(cl:in-package stm_interface-srv)


;//! \htmlinclude RelayControl-request.msg.html

(cl:defclass <RelayControl-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RelayControl-request (<RelayControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RelayControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RelayControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stm_interface-srv:<RelayControl-request> is deprecated: use stm_interface-srv:RelayControl-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <RelayControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stm_interface-srv:data-val is deprecated.  Use stm_interface-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RelayControl-request>) ostream)
  "Serializes a message object of type '<RelayControl-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RelayControl-request>) istream)
  "Deserializes a message object of type '<RelayControl-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'data)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RelayControl-request>)))
  "Returns string type for a service object of type '<RelayControl-request>"
  "stm_interface/RelayControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RelayControl-request)))
  "Returns string type for a service object of type 'RelayControl-request"
  "stm_interface/RelayControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RelayControl-request>)))
  "Returns md5sum for a message object of type '<RelayControl-request>"
  "6db4585f5f37e5eeadda4ec7286a1620")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RelayControl-request)))
  "Returns md5sum for a message object of type 'RelayControl-request"
  "6db4585f5f37e5eeadda4ec7286a1620")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RelayControl-request>)))
  "Returns full string definition for message of type '<RelayControl-request>"
  (cl:format cl:nil "uint8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RelayControl-request)))
  "Returns full string definition for message of type 'RelayControl-request"
  (cl:format cl:nil "uint8 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RelayControl-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RelayControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RelayControl-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude RelayControl-response.msg.html

(cl:defclass <RelayControl-response> (roslisp-msg-protocol:ros-message)
  ((response
    :reader response
    :initarg :response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RelayControl-response (<RelayControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RelayControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RelayControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name stm_interface-srv:<RelayControl-response> is deprecated: use stm_interface-srv:RelayControl-response instead.")))

(cl:ensure-generic-function 'response-val :lambda-list '(m))
(cl:defmethod response-val ((m <RelayControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader stm_interface-srv:response-val is deprecated.  Use stm_interface-srv:response instead.")
  (response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RelayControl-response>) ostream)
  "Serializes a message object of type '<RelayControl-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RelayControl-response>) istream)
  "Deserializes a message object of type '<RelayControl-response>"
    (cl:setf (cl:slot-value msg 'response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RelayControl-response>)))
  "Returns string type for a service object of type '<RelayControl-response>"
  "stm_interface/RelayControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RelayControl-response)))
  "Returns string type for a service object of type 'RelayControl-response"
  "stm_interface/RelayControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RelayControl-response>)))
  "Returns md5sum for a message object of type '<RelayControl-response>"
  "6db4585f5f37e5eeadda4ec7286a1620")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RelayControl-response)))
  "Returns md5sum for a message object of type 'RelayControl-response"
  "6db4585f5f37e5eeadda4ec7286a1620")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RelayControl-response>)))
  "Returns full string definition for message of type '<RelayControl-response>"
  (cl:format cl:nil "bool response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RelayControl-response)))
  "Returns full string definition for message of type 'RelayControl-response"
  (cl:format cl:nil "bool response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RelayControl-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RelayControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RelayControl-response
    (cl:cons ':response (response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RelayControl)))
  'RelayControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RelayControl)))
  'RelayControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RelayControl)))
  "Returns string type for a service object of type '<RelayControl>"
  "stm_interface/RelayControl")