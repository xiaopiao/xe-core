<?php
namespace Step\Acceptance;

class Login extends \AcceptanceTester
{

    public function loginAsUser($id,$pw)
    {
        $I = $this;
        $I->amOnPage('/index.php?mid=index&act=dispMemberLoginForm');
        $I->fillField('#uid', $id);
        $I->fillField('#upw', $pw);
        $I->click('.control-group .submit');
        $I->dontseeElement('.message.error');
    }

    public function loginAsAdmin($pw)
    {
        $I = $this;
        $I->amOnPage('/index.php?mid=index&act=dispMemberLoginForm');
        $I->fillField('#uid', 'admin@admin.net');
        $I->fillField('#upw', $pw);
        $I->click('.control-group .submit');
        $I->dontseeElement('.message.error');
    }

    public function logout()
    {
        $I = $this;
        $I->amOnPage('/index.php?mid=index&act=dispMemberLogout');
    }
}
