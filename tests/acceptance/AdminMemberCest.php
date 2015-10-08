<?php
use \AcceptanceTester;
use \Codeception\Util\Locator;
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
		$I->fillField('password', sq('password'));
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
		$I->XEAdminFormSubmit();
	  
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
		$I->fillField('reset_password', 'e' . sq('password'));
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
		$I->XEAdminFormSubmit();
	  
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
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberSignUpForm'));
		$I->see('회원 가입할 수 없습니다.');
		$login->loginAsAdmin('admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		$I->selectOption('#enable_join_yes','Y');
		$I->XEAdminFormSubmit();
		
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
		$I->XEAdminFormSubmit();
		
		//low
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberModifyPassword'));
		$I->see('비밀번호는 4자 이상이어야 합니다.');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		
		$I->selectOption('#password_strength3','high');
		$I->XEAdminFormSubmit();
		
		//high
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberModifyPassword'));
		$I->see('비밀번호는 8자리 이상이어야 하며 영문과 숫자, 특수문자를 반드시 포함해야 합니다.');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminConfig'));
		
		$I->selectOption('#password_strength2','normal');
		$I->XEAdminFormSubmit();
		
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
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-005
	*/
	public function admin_member_005_004(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('회원가입 설정@회원 가입 약관은 잘 입력되고 잘 반영되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->waitForElement('#cke_editor1',10);
		$I->fillCkEditor('agree' . sq('body'));
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberSignUpForm'));
		$I->see('agree' . sq('body'));
		
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
	
	//
	
	/**
	* @group admin-member
	* @group admin-member-006
	*/
	public function admin_member_006_001(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('가입 폼 관리@로그인 계정 변경은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->selectOption('input[name="identifier"]','user_id');
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsUser('admin','admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->selectOption('input[name="identifier"]','email_address');
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-006
	*/
	public function admin_member_006_002(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('가입 폼 관리@각 항목의 사용 설정은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->executeJS("jQuery('input[value=\"user_name\"]').attr('checked', false);");
		$I->XEAdminFormSubmit();
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminInsert'));
		$I->dontsee('이름');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->executeJS("jQuery('input[value=\"user_name\"]').attr('checked', true);");
		$I->XEAdminFormSubmit();
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminInsert'));
		$I->see('이름');
	}
	
	/**
	* @group admin-member
	* @group admin-member-006
	*/
	public function admin_member_006_003(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('가입 폼 관리@각 항목의 공개 설정은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		
		$I->executeJS("jQuery('input[value=\"user_name\"]').attr('checked', true);");
		$I->executeJS("jQuery('input[name=\"is_user_name_public\"]').attr('checked', false);");
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsUser('email@domain.com','password');
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberInfo','member_srl','265'));
		$I->dontsee('이름');
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->executeJS("jQuery('input[value=\"user_name\"]').attr('checked', true);");
		$I->executeJS("jQuery('input[name=\"is_user_name_public\"]').attr('checked', true);");
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsUser('email@domain.com','password');
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberInfo','member_srl','265'));
		$I->see('이름');
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-006
	*/
	public function admin_member_006_004(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('가입 폼 관리@각 항목의 필수/선택 설정은 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->selectOption('input[name="user_name"]','required');
		$I->XEAdminFormSubmit();
		
		$randVal = sq('join');
		$login->logout();
		$I->amOnPage(XEURL::getNotEncodedUrl('act','dispMemberSignUpForm'));
		$I->fillField('email_address', 'jointest' . $randVal . '@xpessengine.com');
		$I->fillField('password', sq('password'));
		$I->fillField('password2', sq('password'));
		$I->fillField('nick_name', 'jointest' . $randVal);
		$I->fillField('find_account_answer', $randVal);
		$I->XEAdminFormSubmit('.btnArea .btn.btn-inverse.pull-right');
		$I->acceptPopup();
		
		$I->see('회원가입');
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminSignUpConfig'));
		$I->selectOption('input[name="user_name"]','option');
		$I->XEAdminFormSubmit();
		
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-007
	*/
	public function admin_member_007_001(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('로그인 설정@비밀번호 갱신주기 설정은 실제 잘 반영되는가? (마지막 변경 일자가 오래 전인 회원으로 로그인하여 테스트)');
		
		$date = rand(30,60);
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('change_password_date', $date);
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsUser('email@domain.com','password');
		$I->see($date . '일 동안 비밀번호를 변경하지 않았습니다. 개인정보 보호를 위하여 비밀번호를 변경해야 합니다.');
		
		$login->logout();
		$login->loginAsAdmin('admin');
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('change_password_date', 0);
		$I->XEAdminFormSubmit();
		
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-007
	*/
	public function admin_member_007_002(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('로그인 설정@로그인/로그아웃 후 이동할 주소로 실제 잘 이동하는가?');
		$defUrl = $I->executeJS('return default_url');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('after_login_url', $defUrl . 'board1');
		$I->fillField('after_logout_url', $defUrl . 'board2');
		$I->XEAdminFormSubmit();
		
		$login->logout();
		$login->loginAsUser('email@domain.com','password');
		$I->see('Board1');
		
		$login->logout();
		$I->see('Board2');
		$login->loginAsAdmin('admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('after_login_url', '');
		$I->fillField('after_logout_url', '');
		$I->XEAdminFormSubmit();
		
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-007
	*/
	public function admin_member_007_003(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('로그인 설정@로그인 시도 회수 제한 설정(횟수/시간)이 실제 잘 반영되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('max_error_count', 3);
		$I->fillField('max_error_count_time', 3);
		$I->XEAdminFormSubmit();
		
		$login->logout();
		
		for($i=1;$i<=3;$i++)
		{
			$login->loginAsUser('email@domain.com','wrongpassword');
		}
		$login->loginAsUser('email@domain.com','wrongpassword');
		
		$I->see('로그인 가능 횟수를 초과했습니다.');
		$I->wait(3);
		$login->loginAsUser('email@domain.com','password');
		$login->logout();
		
		$login->loginAsAdmin('admin');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminLoginConfig'));
		$I->fillField('max_error_count', 10);
		$I->fillField('max_error_count_time', 300);
		$I->XEAdminFormSubmit();
		
		$I->saveSessionSnapshot('admin');
	}
	
	/**
	* @group admin-member
	* @group admin-member-008
	*/
	public function admin_member_008_001(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('디자인 설정/레이아웃@레이아웃 설정이 잘 반영되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminDesignConfig'));
		$I->selectOption('#layout','미사용');
		$I->XEAdminFormSubmit();
		
		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board1','act','dispMemberInfo'));
		$I->see('Membership');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2','act','dispMemberInfo'));
		$I->see('Site Logo');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminDesignConfig'));
		$I->selectOption('#layout','XE 공식 사이트 레이아웃 (xe_official)');
		$I->XEAdminFormSubmit();
		
		$I->amOnPage(XEURL::getNotEncodedUrl('mid','board2','act','dispMemberInfo'));
		$I->see('Powered by XE');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminDesignConfig'));
		$I->selectOption('#layout','미사용');
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-010
	*/
	public function admin_member_010_001(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('그룹 관리@회원 그룹이 잘 추가되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminGroupList'));
		$I->click('._addGroup');
		$I->executeJS("jQuery('._template').remove();");
		$I->fillField('#lang___lang_code_3', 'gggggggg');
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-010
	*/
	public function admin_member_010_002(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('그룹 관리@회원 그룹이 잘 수정되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminGroupList'));
		$I->fillField('#lang___lang_code_3', 'group');
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-010
	*/
	public function admin_member_010_003(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('그룹 관리@회원 그룹이 잘 삭제되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminGroupList'));
		$I->executeJS("jQuery('._deleteGroup')[3].click()");
		$I->acceptPopup();
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-010
	*/
	public function admin_member_010_006(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('그룹 관리@기본 그룹 선택이 잘 되는가?');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminGroupList'));
		$I->selectOption('input[name="defaultGroup"]',3);
		$I->XEAdminFormSubmit();
	}
	
	/**
	* @group admin-member
	* @group admin-member-010
	*/
	public function admin_member_010_007(AcceptanceTester $I, Step\Acceptance\Login $login)
	{
		$I->wantTo('그룹 관리@회원 가입시 기본 그룹이 잘 지정되는가?');
		
		$randVal = sq('group');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminInsert'));
		$I->seeElement('.x_controls #identifierForm');
		$I->fillField('email_address', 'jointest' . $randVal . '@xpessengine.com');
		$I->fillField('password', sq('password'));
		$I->fillField('nick_name', 'jointest' . $randVal);
		$I->fillField('find_account_answer', $randVal);
		$I->XEAdminFormSubmit();
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminList'));
		$I->see('정회원');
		
		$I->click('tbody tr td input');
		$I->click('삭제');
		$I->XEAdminFormSubmit('.x_pull-right button.x_btn-inverse');
		
		$I->amOnPage(XEURL::getNotEncodedUrl('module','admin','act','dispMemberAdminGroupList'));
		$I->selectOption('input[name="defaultGroup"]',2);
		$I->XEAdminFormSubmit();
	}
}