<?php
namespace Step\Acceptance;
use Page\XEURLBuilder as XEURL;

class Login extends \AcceptanceTester
{

	public function loginAsUser($id,$pw)
	{
		$I = $this;
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLoginForm'));
		$I->submitForm('#fo_member_login', array(
			'user_id' => $id,
			'password' => $pw
		));
	}

	public function loginAsAdmin($pw)
	{
		$I = $this;
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLoginForm'));
		$I->submitForm('#fo_member_login', array(
			'user_id' => 'admin@admin.net',
			'password' => $pw
		));
	}

	public function logout()
	{
		$I = $this;
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberLogout'));
		$I->wait(1);
	}
}
