import graphene
from graphene_django.types import DjangoObjectType
from habsci.services.schema import ServiceType, ServiceQuery
from habsci.services.mutations import CreateService


class Query(graphene.ObjectType):
    all_services = graphene.List(ServiceType)
    resolve_all_services = ServiceQuery.resolve_all_services
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

class Mutation(graphene.ObjectType):
    create_service = CreateService.Field()
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

schema = graphene.Schema(query=Query, mutation=Mutation)