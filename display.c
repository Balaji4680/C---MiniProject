#include "phonebook.h"
void display_contact(CONTACT *head)
{
	CONTACT *temp;
	int i;
	if(head==NULL)
	{
		printf("phonebook is empty\n");
		return ;
	}
	temp=head;
	while(temp!=NULL)
	{
		printf("name:%s\n",temp->name);
		for(i=0;i<temp->phone_count;i++)
		{
			printf("phone number[%d] :%s\n",i+1,temp->phone[i]);
		}
		printf("email:%s\n",temp->email);
		printf("address:%s\n",temp->address);
		temp=temp->next;
	}
}

