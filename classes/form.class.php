<?php

class clsForm
{
	var $values=array();
	var $errors=array();
	var $num_errors;
	
	function setError($field, $errmsg)
	{
		  $this->errors[$field] = $errmsg;
		  $this->num_errors = count($this->errors);
   	}

   /**
    * error - Returns the error message attached to the
    * given field, if none exists, the empty string is returned.
    */
   function Error($field){
      if(array_key_exists($field,$this->errors)){
         return $this->errors[$field];
      }else{
         return "";
      }
   }

   /* getErrorArray - Returns the array of error messages */
   function getErrorArray(){
      return $this->errors;
   }

	/* Returns the number of errors */
	function getErrorCount()
	{
		return $this->num_errors;
	}

}
	
	
?>