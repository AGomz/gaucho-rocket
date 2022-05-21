<?php
session_start();
include_once("config/Configuration.php");

// include('./helpers/Validator.php');
// die();

$module = isset($_GET["module"]) ? $_GET["module"] : "GauchoRocket";
$action = isset($_GET["action"]) ? $_GET["action"] : "show";

$configuration = new Configuration();
$router = $configuration->createRouter("createGauchoRocketController", "show");

$router->executeActionFromModule($module, $action);
