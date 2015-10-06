<?php
/* Copyright (C) NAVER <http://www.navercorp.com> */

namespace Page;

class XEURLBuilder
{
	/**
	* Get a encoded url. Define a function to use Context::getUrl()
	*
	* getUrl() returns the URL transformed from given arguments of RequestURI
	* <ol>
	*  <li>argument format follows as (key, value).
	* ex) getUrl('key1', 'val1', 'key2',''): transform key1 and key2 to val1 and '' respectively</li>
	* <li>returns URL without the argument if no argument is given.</li>
	* <li>URL made of args_list added to RequestUri if the first argument value is ''.</li>
	* </ol>
	*
	* @return string
	*/
	public static function getUrl()
	{
		$num_args = func_num_args();
		$args_list = func_get_args();
		
		if($num_args)
		{
			// rearrange args_list
			if(is_array($num_args) && $num_args[0] === TRUE)
			{
				array_shift($args_list);
				$url = self::_getUrl($num_args, $args_list, TRUE, TRUE, TRUE);
			}
			elseif(is_array($num_args) && $num_args[0] === FALSE)
			{
				array_shift($args_list);
				$url = self::_getUrl($num_args, $args_list, TRUE, TRUE, FALSE);
			}
			else
			{
				$url = self::_getUrl($num_args, $args_list, TRUE, TRUE, FALSE);
			}
		}
		else
		{
			$url = '/';
		}
		
		return preg_replace('@\berror_return_url=[^&]*|\w+=(?:&|$)@', '', $url);
	}
	
	/**
	* Get a not encoded(html entity) url
	*
	* @see getUrl()
	* @return string
	*/
	public static function getNotEncodedUrl()
	{
		$num_args = func_num_args();
		$args_list = func_get_args();
		if($num_args)
		{
			// rearrange args_list
			if(is_array($num_args) && $num_args[0] === TRUE)
			{
				array_shift($args_list);
				$url = self::_getUrl($num_args, $args_list, FALSE, FALSE, TRUE);
			}
			elseif(is_array($num_args) && $num_args[0] === FALSE)
			{
				array_shift($args_list);
				$url = self::_getUrl($num_args, $args_list, FALSE, FALSE, FALSE);
			}
			else
			{
				$url = self::_getUrl($num_args, $args_list, FALSE, FALSE, FALSE);
			}
		}
		else
		{
			$url = '/';
		}
		return preg_replace('@\berror_return_url=[^&]*|\w+=(?:&|$)@', '', $url);
	}
	
	/**
	* Make URL with args_list upon request URL
	* Simple version of XE's Context::getUrl()
	*
	* @param int $num_args Arguments nums
	* @param array $args_list Argument list for set url
	* @param string $domain Domain
	* @param bool $encode If TRUE, use url encode.
	* @param bool $autoEncode If TRUE, url encode automatically, detailed. Use this option, $encode value should be TRUE
	* @return string URL
	*/
	private function _getUrl($num_args = 0, $args_list = array(), $encode = TRUE, $autoEncode = FALSE, $useRewrite = FALSE)
	{
		$get_vars = array();
		
		// rearrange args_list
		if(is_array($args_list) && $args_list[0] == '')
		{
			array_shift($args_list);
		}
		
		// arrange args_list
		for($i = 0, $c = count($args_list); $i < $c; $i += 2)
		{
			$key = $args_list[$i];
			$val = trim($args_list[$i + 1]);
			// If value is not set, remove the key
			if(!isset($val) || !strlen($val))
			{
				unset($get_vars[$key]);
				continue;
			}
			// set new variables
			$get_vars[$key] = $val;
		}
		
		// organize URL
		$query = '';
		if(count($get_vars) > 0)
		{
			// if using rewrite mod
			if($useRewrite)
			{
				$var_keys = array_keys($get_vars);
				sort($var_keys);
				$target = join('.', $var_keys);
				$act = $get_vars['act'];
				$vid = $get_vars['vid'];
				$mid = $get_vars['mid'];
				$key = $get_vars['key'];
				$srl = $get_vars['document_srl'];
				$tmpArray = array('rss' => 1, 'atom' => 1, 'api' => 1);
				$is_feed = isset($tmpArray[$act]);
				$target_map = array(
					'vid' => $vid,
					'mid' => $mid,
					'mid.vid' => "$vid/$mid",
					'entry.mid' => "$mid/entry/" . $get_vars['entry'],
					'entry.mid.vid' => "$vid/$mid/entry/" . $get_vars['entry'],
					'document_srl' => $srl,
					'document_srl.mid' => "$mid/$srl",
					'document_srl.vid' => "$vid/$srl",
					'document_srl.mid.vid' => "$vid/$mid/$srl",
					'act' => ($is_feed && $act !== 'api') ? $act : '',
					'act.mid' => $is_feed ? "$mid/$act" : '',
					'act.mid.vid' => $is_feed ? "$vid/$mid/$act" : '',
					'act.document_srl.key' => ($act == 'trackback') ? "$srl/$key/$act" : '',
					'act.document_srl.key.mid' => ($act == 'trackback') ? "$mid/$srl/$key/$act" : '',
					'act.document_srl.key.vid' => ($act == 'trackback') ? "$vid/$srl/$key/$act" : '',
					'act.document_srl.key.mid.vid' => ($act == 'trackback') ? "$vid/$mid/$srl/$key/$act" : ''
				);
				$query = $target_map[$target];
			}
			if(!$query)
			{
				$queries = array();
				foreach($get_vars as $key => $val)
				{
					if(is_array($val) && count($val) > 0)
					{
						foreach($val as $k => $v)
						{
							$queries[] = $key . '[' . $k . ']=' . urlencode($v);
						}
					}
					elseif(!is_array($val))
					{
						$queries[] = $key . '=' . urlencode($val);
					}
				}
				if(count($queries) > 0)
				{
					$query = 'index.php?' . join('&', $queries);
				}
			}
		}
		
		if(!$encode)
		{
			return $query;
		}
		
		if(!$autoEncode)
		{
			return htmlspecialchars($query, ENT_COMPAT | ENT_HTML401, 'UTF-8', FALSE);
		}
		
		$output = array();
		$encode_queries = array();
		$parsedUrl = parse_url($query);
		parse_str($parsedUrl['query'], $output);
		foreach($output as $key => $value)
		{
			if(preg_match('/&([a-z]{2,}|#\d+);/', urldecode($value)))
			{
				$value = urlencode(htmlspecialchars_decode(urldecode($value)));
			}
			$encode_queries[] = $key . '=' . $value;
		}
		return htmlspecialchars($parsedUrl['path'] . '?' . join('&', $encode_queries), ENT_COMPAT | ENT_HTML401, 'UTF-8', FALSE);
	}
}
