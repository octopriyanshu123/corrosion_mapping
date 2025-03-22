;; Auto-generated. Do not edit!


(when (boundp 'stm_interface::RelayControl)
  (if (not (find-package "STM_INTERFACE"))
    (make-package "STM_INTERFACE"))
  (shadow 'RelayControl (find-package "STM_INTERFACE")))
(unless (find-package "STM_INTERFACE::RELAYCONTROL")
  (make-package "STM_INTERFACE::RELAYCONTROL"))
(unless (find-package "STM_INTERFACE::RELAYCONTROLREQUEST")
  (make-package "STM_INTERFACE::RELAYCONTROLREQUEST"))
(unless (find-package "STM_INTERFACE::RELAYCONTROLRESPONSE")
  (make-package "STM_INTERFACE::RELAYCONTROLRESPONSE"))

(in-package "ROS")





(defclass stm_interface::RelayControlRequest
  :super ros::object
  :slots (_data ))

(defmethod stm_interface::RelayControlRequest
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint8 _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _data
       (write-byte _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _data
     (setq _data (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass stm_interface::RelayControlResponse
  :super ros::object
  :slots (_response ))

(defmethod stm_interface::RelayControlResponse
  (:init
   (&key
    ((:response __response) nil)
    )
   (send-super :init)
   (setq _response __response)
   self)
  (:response
   (&optional (__response :null))
   (if (not (eq __response :null)) (setq _response __response)) _response)
  (:serialization-length
   ()
   (+
    ;; bool _response
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _response
       (if _response (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _response
     (setq _response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass stm_interface::RelayControl
  :super ros::object
  :slots ())

(setf (get stm_interface::RelayControl :md5sum-) "6db4585f5f37e5eeadda4ec7286a1620")
(setf (get stm_interface::RelayControl :datatype-) "stm_interface/RelayControl")
(setf (get stm_interface::RelayControl :request) stm_interface::RelayControlRequest)
(setf (get stm_interface::RelayControl :response) stm_interface::RelayControlResponse)

(defmethod stm_interface::RelayControlRequest
  (:response () (instance stm_interface::RelayControlResponse :init)))

(setf (get stm_interface::RelayControlRequest :md5sum-) "6db4585f5f37e5eeadda4ec7286a1620")
(setf (get stm_interface::RelayControlRequest :datatype-) "stm_interface/RelayControlRequest")
(setf (get stm_interface::RelayControlRequest :definition-)
      "uint8 data
---
bool response
")

(setf (get stm_interface::RelayControlResponse :md5sum-) "6db4585f5f37e5eeadda4ec7286a1620")
(setf (get stm_interface::RelayControlResponse :datatype-) "stm_interface/RelayControlResponse")
(setf (get stm_interface::RelayControlResponse :definition-)
      "uint8 data
---
bool response
")



(provide :stm_interface/RelayControl "6db4585f5f37e5eeadda4ec7286a1620")


