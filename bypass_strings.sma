#include <amxmodx>

/* Prepare SQL Payload */
#define SQL_QUERY "SELECT * FROM `users` WHERE `nickname` = 'edit'"

/* SQL Payload Length + Max Name Length */
#define SQL_QUERY_LEN 80

/* Updating Variable That Contains Our SQL Payload, Updating Editable Text With Received Data, Calling "SQL_Query", Reformat SQL Variable */
#define format_query(%1) replace(sz_Query, SQL_QUERY_LEN-1, "edit", %1); insert_update_data(); formatex(sz_Query, SQL_QUERY_LEN-1, SQL_QUERY)


/* Cache Users NickName For Our Example*/
new g_Array_Users[33][32];

/* Our SQL Variable We Care About */
new sz_Query [SQL_QUERY_LEN] = SQL_QUERY;

public client_putinserver(id)
{
	/* Getting User NickName And Cache It To The Array */
	new Name[33];
	get_user_name(id, Name, 32);
	
	formatex(g_Array_Users[id], sizeof(g_Array_Users)-1, Name);
	
	/* Calling The Macro And Parse User NickName */
	format_query(g_Array_Users[id]);
}

insert_update_data()
{
	/* Imagine you have SQL_ThreadQuery */
	log_amx(sz_Query);
}
