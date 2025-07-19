package com.surya;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class ControllerOperations {

	@GetMapping("/msg")
	public String getMethodName(@RequestParam String name) {
		return "Good Morning " + name + " bro";
	}

}
