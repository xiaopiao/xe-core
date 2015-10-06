<?php
use \AcceptanceTester;
use Page\XEURLBuilder as XEURL;

class AdminMemberCest
{
	public function _before(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->amOnPage('/');
		if ($I->loadSessionSnapshot('admin')) return;
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}

	public function _after(\Step\Acceptance\Login $I)
	{
	}

	/**
	* @group admin-member
	* @group admin-member-001
	*/
	public function admin_member_001_001(AcceptanceTester $I)
	{
		$I->wantTo('회원 목록@모든회원, 최고관리자, 승인, 거부 카테고리 별 목록이 잘 나오는가?');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','filter_type','super_admin'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','filter_type','enable'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','filter_type','disable'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
	}

	/**
	* @group admin-member
	* @group admin-member-001
	*/
	public function admin_member_001_002(AcceptanceTester $I)
	{
		$I->wantTo('회원 목록@페이지 이동이 잘 되는가?');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','page','2'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
	}
	
	/**
	* @group admin-member
	* @group admin-member-002
	*/
	public function admin_member_002_001(AcceptanceTester $I)
	{
		$I->wantTo('검색@항목 별 검색(이메일, 닉네임 등)이 잘 되는가? & 검색 취소가 잘 되는가?');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','user_id','search_keyword','user_id'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','user_name','search_keyword','user_name'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','nick_name','search_keyword','nick_name'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','email_address','search_keyword','email@domain.com'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','regdate','search_keyword',date("Ymd")));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','regdate_more','search_keyword','19500101'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','regdate_less','search_keyword','20501231'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','last_login','search_keyword',date("Ymd")));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','last_login_more','search_keyword','19500101'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','last_login_less','search_keyword','20501231'));
		$I->seeElement('tbody tr td');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList','selected_group_srl',0,'search_target','birthday','search_keyword','20000101'));
		$I->seeElement('tbody tr td');
	  
		$I->click('취소');
		$I->cantSeeInField('search_keyword', '20000101');
	}
  
	/**
	* @group admin-member
	* @group admin-member-003
	*/
	public function admin_member_003_001(AcceptanceTester $I)
	{
		$randVal = sq('tester');
		$I->wantTo('목록에서 회원 관리@추가/수정시 각 항목 입력이 잘 되는가? (특히 날짜 타입)');
	  
		//insert test
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminInsert'));
		$I->seeElement('.x_controls #identifierForm');
		$I->fillField('email_address', 'tester' . $randVal . '@xpessengine.com');
		$I->fillField('password', '1234');
		$I->fillField('user_id', 'test_id' . $randVal);
		$I->fillField('user_name', 'test_name' . $randVal);
		$I->fillField('nick_name', 'test_nick' . $randVal);
		$I->selectOption('find_account_question','나의 출신 고향은?');
		$I->fillField('find_account_answer', '꽃피는 산골');
		$I->fillField('homepage', 'http://example.com/tester' . $randVal);
		$I->fillField('blog', 'http://blog.example.com/tester' . $randVal);
		$I->click('#birthday');
		$I->selectOption('.ui-datepicker-year','1990');
		$I->click('.ui-datepicker-calendar a');
		$I->click('.x_pull-right input.x_btn-primary');
	  
		$I->amOnPage('/' . $I->executeJS("return jQuery('tbody tr .nowr a')[1].href.replace(request_uri,'')"));
		$I->see('회원정보 조회/수정');
	  
		// insert confirm
		$I->canSeeInField('email_address', 'tester' . $randVal . '@xpessengine.com');
		$I->canSeeInField('user_id', 'test_id' . $randVal);
		$I->canSeeInField('user_name', 'test_name' . $randVal);
		$I->canSeeInField('nick_name', 'test_nick' . $randVal);
		$I->canSeeInField('find_account_answer', '꽃피는 산골');
		$I->canSeeInField('homepage', 'http://example.com/tester' . $randVal);
		$I->canSeeInField('blog', 'http://blog.example.com/tester' . $randVal);
	  
		// edit test
		$I->fillField('reset_password', 'e1234');
		$I->fillField('user_id', 'e_test_id' . $randVal);
		$I->fillField('user_name', 'e_test_name' . $randVal);
		$I->fillField('nick_name', 'e_test_nick' . $randVal);
		$I->selectOption('find_account_question','나의 출신 초등학교는?');
		$I->fillField('find_account_answer', 'XEHub');
		$I->fillField('homepage', 'http://xe.com/tester' . $randVal);
		$I->fillField('blog', 'http://blog.xe.com/tester' . $randVal);
		$I->click('#birthday');
		$I->selectOption('.ui-datepicker-year','1991');
		$I->click('.ui-datepicker-calendar a');
		$I->click('.x_pull-right input.x_btn-primary');
	  
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->amOnPage('/' . $I->executeJS("return jQuery('tbody tr .nowr a')[1].href.replace(request_uri,'')"));
		$I->see('회원정보 조회/수정');
	  
		// edit confirm
		$I->canSeeInField('user_id', 'e_test_id' . $randVal);
		$I->canSeeInField('user_name', 'e_test_name' . $randVal);
		$I->canSeeInField('nick_name', 'e_test_nick' . $randVal);
		$I->canSeeInField('find_account_answer', 'XEHub');
		$I->canSeeInField('homepage', 'http://xe.com/tester' . $randVal);
		$I->canSeeInField('blog', 'http://blog.xe.com/tester' . $randVal);
	}
	
	/**
	* @group admin-member
	* @group admin-member-003
	*/
	public function admin_member_003_002(AcceptanceTester $I)
	{
		$I->wantTo('목록에서 회원 관리@회원 선택하지 않고 수정/삭제 클릭 시 오류는 없는가?');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		
		$I->click('수정');
		$I->see('관리할 회원을 선택해주세요.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
		
		$I->click('삭제');
		$I->see('관리할 회원을 선택해주세요.');
		$I->click('.x_btn.x_btn-inverse.x_pull-right.x_btn-primary._ok');
	}
	
	/**
	* @group admin-member
	* @group admin-member-003
	*/
	public function admin_member_003_003(AcceptanceTester $I)
	{
		$I->wantTo('목록에서 회원 관리@지정한 그룹으로 수정이 잘 되는가?');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->seeElement('.x_btn-group .x_btn-inverse');
		
		$I->click('tbody tr td input');
		$I->click('수정');
		$I->checkOption('#g3');
		
		$I->click('.x_pull-right button.x_btn-inverse');
		$I->see('정회원');
	}
	
	/**
	* @group admin-member
	* @group admin-member-003
	*/
	public function admin_member_003_004(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('목록에서 회원 관리@해당 회원에게 쪽지 발송은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->click('email@domain.com');
		$I->click('쪽지 보내기');
		$I->switchToWindow("popup");
		
		$I->fillField('title', 'titie' . sq('title'));
		$I->fillCkEditor('body' . sq('body'));
		
		$I->click('div.btnArea input.btn.btn-inverse');
		$I->acceptPopup();
		
		$I->switchToWindow();
		
		$login->logout();
		$login->loginAsUser('email@domain.com','password');
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispCommunicationMessages'));
		$I->see('titie' . sq('title'));
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-003
	*/
	public function admin_member_003_005(AcceptanceTester $I)
	{
		$I->wantTo('목록에서 회원 관리@회원 선택 후 삭제는 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->click('tbody tr td input');
		$I->click('삭제');
		$I->click('.x_pull-right button.x_btn-inverse');
	}
	
	/**
	* @group admin-member
	* @group admin-member-004
	*/
	public function admin_member_004_001(AcceptanceTester $I)
	{
		$I->wantTo('기본 설정@회원정보 동기화는 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		$I->click('#member_sync');
		// @TODO 동기화 여부 검증 추가
	}
	
	/**
	* @group admin-member
	* @group admin-member-004
	*/
	public function admin_member_004_002(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('기본 설정@회원 가입 허가 설정이 실제 잘 반영되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		$I->selectOption('#enable_join_no','N');
		$I->click('.x_pull-right input.x_btn-primary');
		
		$login->logout();
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberSignUpForm'));
		$I->see('회원 가입할 수 없습니다.');
		$login->loginAsAdmin('admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		$I->selectOption('#enable_join_yes','Y');
		$I->click('.x_pull-right input.x_btn-primary');
		
		$login->logout();
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberSignUpForm'));
		$I->see('회원가입');
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-004
	*/
	public function admin_member_004_005(AcceptanceTester $I)
	{
		$I->wantTo('기본 설정@비밀번호 보안수준 설정이 저장되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		$I->selectOption('#password_strength1','low');
		$I->click('.x_pull-right input.x_btn-primary');
		
		//low
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberModifyPassword'));
		$I->see('비밀번호는 4자 이상이어야 합니다.');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		
		$I->selectOption('#password_strength3','high');
		$I->click('.x_pull-right input.x_btn-primary');
		
		//high
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberModifyPassword'));
		$I->see('비밀번호는 8자리 이상이어야 하며 영문과 숫자, 특수문자를 반드시 포함해야 합니다.');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		
		$I->selectOption('#password_strength2','normal');
		$I->click('.x_pull-right input.x_btn-primary');
		
		//normal
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberModifyPassword'));
		$I->see('비밀번호는 6자리 이상이어야 하며 영문과 숫자를 반드시 포함해야 합니다.');
	}
	
	/**
	* @group admin-member
	* @group admin-member-005
	*/
	public function admin_member_005_001(AcceptanceTester $I)
	{
		$I->wantTo('회원가입 설정@금지 닉네임 추가/삭제는 잘 되는가? (전체 설정을 저장하기 전에 각각 추가, 삭제해보고 전체 설정을 저장한 후에 삭제도 해 본다) / 금지 아이디 관리는 잘 되는가? (전체 설정을 저장하기 전에 각각 추가, 삭제해보고 전체 설정을 저장한 후에 삭제도 해 본다) / 실제 가입/회원 정보 수정 시 금지 닉네임/금지 아이디 적용이 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->fillField('#prohibited_nick_name', 'nickname' . sq('nick'));
		$I->click('._addDeniedNickName');
		
		$I->fillField('#prohibited_id', 'userid' . sq('id'));
		$I->click('._addDeniedID');
		
		/*
		$I->click('.moduleTrigger');
		$I->click('Board2');
		$I->click('.x_btn.x_pull-right.x_btn-primary._ok.x_btn-danger');
		$I->click('.x_pull-right input.x_btn-primary');
		*/
		
		$I->waitForElement('.x_btn.moduleTrigger',10);
		$I->see('nickname' . sq('nick'));
		$I->see('userid' . sq('id'));
		
		// normal nickname check
		$I->executeJS("var _name  = 'nick_name';var _value = 'XEHub';var params = {name:_name, value:_value};var response_tags = ['error','message'];exec_xml('member','procMemberCheckValue', params, function(ret_obj, response_tags, field){if(ret_obj['message']=='success'){document.write('<p class=\"nickcheckResult\">SUCCESS</p>');}else{document.write('<p class=\"nickcheckResult\">FAIL</p>');}} , response_tags);");
		$I->waitForElement('.nickcheckResult',10);
		$I->see('SUCCESS');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		// denied nickname check
		$I->executeJS("var _name  = 'nick_name';var _value = '" . 'nickname' . sq('nick') . "';var params = {name:_name, value:_value};var response_tags = ['error','message'];exec_xml('member','procMemberCheckValue', params, function(ret_obj, response_tags, field){if(ret_obj['message']=='success'){document.write('<p class=\"nickcheckResult\">FAIL</p>');}else{document.write('<p class=\"nickcheckResult\">SUCCESS</p>');}} , response_tags);");
		$I->waitForElement('.nickcheckResult',10);
		$I->see('SUCCESS');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		// normal id check
		$I->executeJS("var _name  = 'user_id';var _value = 'xehub';var params = {name:_name, value:_value};var response_tags = ['error','message'];exec_xml('member','procMemberCheckValue', params, function(ret_obj, response_tags, field){if(ret_obj['message']=='success'){document.write('<p class=\"idcheckResult\">SUCCESS</p>');}else{document.write('<p class=\"idcheckResult\">FAIL</p>');}} , response_tags);");
		$I->waitForElement('.idcheckResult',10);
		$I->see('SUCCESS');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		// denied id check
		$I->executeJS("var _name  = 'user_id';var _value = '" . 'userid' . sq('id') . "';var params = {name:_name, value:_value};var response_tags = ['error','message'];exec_xml('member','procMemberCheckValue', params, function(ret_obj, response_tags, field){if(ret_obj['message']=='success'){document.write('<p class=\"idcheckResult\">FAIL</p>');}else{document.write('<p class=\"idcheckResult\">SUCCESS</p>');}} , response_tags);");
		$I->waitForElement('.idcheckResult',10);
		$I->see('SUCCESS');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->executeJS("doUpdateDeniedNickName('" . 'nickname' . sq('nick') . "','delete','SUCCESS');return false;");
		$I->acceptPopup();
		
		$I->executeJS("doUpdateDeniedID('" . 'userid' . sq('id') . "','delete','SUCCESS');return false;");
		$I->acceptPopup();
	}
	
	/**
	* @group admin-member
	* @group admin-member-005
	*/
	public function admin_member_005_002(AcceptanceTester $I)
	{
		$I->wantTo('회원가입 설정@회원 가입 후 이동할 페이지 선택은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->click('.moduleTrigger');
		$I->click('Board2');
		$I->click('.x_btn.x_pull-right.x_btn-primary._ok.x_btn-danger');
		$I->click('.x_pull-right input.x_btn-primary');
	}
	
	/**
	* @group admin-member
	* @group admin-member-006
	*/
	public function admin_member_006_001(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('가입 폼 관리@로그인 계정 변경은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->selectOption('input[name="identifier"]','user_id');
		$I->click('.x_pull-right input.x_btn-primary');
		
		$login->logout();
		$login->loginAsUser('admin','admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->selectOption('input[name="identifier"]','email_address');
		$I->click('.x_pull-right input.x_btn-primary');
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
}