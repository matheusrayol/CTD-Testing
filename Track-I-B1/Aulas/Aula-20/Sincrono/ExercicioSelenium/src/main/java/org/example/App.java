package org.example;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;

public class App
{
    public static void main( String[] args )
    {
        WebDriver driver = new EdgeDriver();
        driver.get("https://www.saucedemo.com");

        WebElement campoUsuario = driver.findElement(By.id("user-name"));
        campoUsuario.sendKeys("standard_user");

        WebElement campoPassword = driver.findElement(By.id("password"));
        campoPassword.sendKeys("secret_sauce");

        WebElement botonLogin = driver.findElement(By.className("btn_action"));
        botonLogin.click();
    }
}
