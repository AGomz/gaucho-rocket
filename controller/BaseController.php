<?php


class BaseController
{
    protected function checkIfSessionIsNotValid($relativeRoute = "/error")
    {
        SessionManager::checkIfSessionIsNotValid($relativeRoute);
        if (SessionManager::userIsAdmin()) {
            Redirect::to($relativeRoute);
        }
    }

}