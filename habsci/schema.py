import graphene
from graphene_django.types import DjangoObjectType
from habsci.services.schema import ServiceType, Query as ServiceQuery


class Query(graphene.ObjectType):
    all_services = graphene.List(ServiceType)
    resolve_all_services = ServiceQuery.resolve_all_services
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

schema = graphene.Schema(query=Query)