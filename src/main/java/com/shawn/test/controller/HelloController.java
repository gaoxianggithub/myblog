package com.shawn.test.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: shawn
 * @date: 2020/3/21 0:03
 * @description:
 */
@RestController
public class HelloController {
    @RequestMapping("hello")
    String hello() {
        return "hello, gaoxiang";
    }
}
